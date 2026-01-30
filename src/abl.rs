use std::{fs, path::PathBuf};
use zed_extension_api::{self as zed, LanguageServerId, Result, Worktree, serde_json};

struct AblExtension {
    cached_binary_path: Option<PathBuf>,
}

impl AblExtension {
    fn language_server_binary_path(
        &mut self,
        language_server_id: &LanguageServerId,
        _worktree: &Worktree,
    ) -> Result<PathBuf> {
        zed::set_language_server_installation_status(
            language_server_id,
            &zed::LanguageServerInstallationStatus::CheckingForUpdate,
        );

        let release = zed::latest_github_release(
            "usagi-coffee/abl-language-server",
            zed::GithubReleaseOptions {
                require_assets: true,
                pre_release: false,
            },
        )?;

        let (platform, arch) = zed::current_platform();
        let os_name = match platform {
            zed::Os::Mac => "macos",
            zed::Os::Linux => "linux",
            zed::Os::Windows => "windows",
        };

        let arch_name = match arch {
            zed::Architecture::Aarch64 => "aarch64",
            zed::Architecture::X8664 => "x86_64",
            zed::Architecture::X86 => "x86_64", // Fallback to x86_64
        };

        let asset_name = format!(
            "abl-language-server-{os_name}-{arch_name}{}",
            if platform == zed::Os::Windows {
                ".exe"
            } else {
                ""
            }
        );

        let asset = release
            .assets
            .iter()
            .find(|asset| asset.name == asset_name)
            .ok_or_else(|| format!("no asset found matching {:?}", asset_name))?;

        let version_dir = format!("abl-language-server-{}", release.version);
        let binary_name = format!(
            "abl-language-server{}",
            if platform == zed::Os::Windows {
                ".exe"
            } else {
                ""
            }
        );
        let binary_path = format!("{version_dir}/{binary_name}");

        // Check if we already have this version
        if let Some(cached_path) = &self.cached_binary_path {
            if cached_path.to_str() == Some(&binary_path)
                && fs::metadata(&binary_path).map_or(false, |stat| stat.is_file())
            {
                return Ok(cached_path.clone());
            }
        }

        // Download if we don't have this version
        if !fs::metadata(&binary_path).map_or(false, |stat| stat.is_file()) {
            zed::set_language_server_installation_status(
                language_server_id,
                &zed::LanguageServerInstallationStatus::Downloading,
            );

            // Create the version directory first
            fs::create_dir_all(&version_dir)
                .map_err(|e| format!("failed to create version directory: {e}"))?;

            // Download the single binary file to the full path
            let downloaded_path = format!("{version_dir}/{asset_name}");
            zed::download_file(
                &asset.download_url,
                &downloaded_path,
                zed::DownloadedFileType::Uncompressed,
            )
            .map_err(|e| format!("failed to download file: {e}"))?;

            // The file is downloaded with the asset name, rename it to the standard binary name
            if downloaded_path != binary_path {
                fs::rename(&downloaded_path, &binary_path)
                    .map_err(|e| format!("failed to rename binary: {e}"))?;
            }

            zed::make_file_executable(&binary_path)?;

            // Clean up old versions
            let entries =
                fs::read_dir(".").map_err(|e| format!("failed to list working directory {e}"))?;
            for entry in entries {
                let entry = entry.map_err(|e| format!("failed to load directory entry {e}"))?;
                if entry.file_name().to_str() != Some(&version_dir) {
                    fs::remove_dir_all(&entry.path()).ok();
                }
            }
        }

        self.cached_binary_path = Some(binary_path.clone().into());
        Ok(binary_path.into())
    }
}

impl zed::Extension for AblExtension {
    fn new() -> Self {
        Self {
            cached_binary_path: None,
        }
    }

    fn language_server_command(
        &mut self,
        id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        let path = self.language_server_binary_path(id, worktree)?;

        Ok(zed::Command {
            command: path.to_string_lossy().into(),
            args: vec!["--stdio".to_string()],
            env: vec![("RUST_LOG".to_string(), "DEBUG".to_string())],
        })
    }

    fn language_server_initialization_options(
        &mut self,
        _: &zed::LanguageServerId,
        _: &zed::Worktree,
    ) -> Result<Option<serde_json::Value>> {
        let config = serde_json::json!({});

        Ok(Some(serde_json::json!({
            "configuration": {
                "abl": config
            }
        })))
    }

    fn language_server_additional_workspace_configuration(
        &mut self,
        _id: &zed::LanguageServerId,
        _target_id: &zed::LanguageServerId,
        _: &zed::Worktree,
    ) -> Result<Option<serde_json::Value>> {
        Ok(None)
    }
}

zed::register_extension!(AblExtension);
