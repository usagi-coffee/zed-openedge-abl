use std::{collections::HashMap, path::PathBuf};
use zed_extension_api::{self as zed, Result, serde_json};
struct AblExtension {}

impl AblExtension {}

impl zed::Extension for AblExtension {
    fn new() -> Self {
        Self {}
    }

    fn language_server_command(
        &mut self,
        id: &zed::LanguageServerId,
        _: &zed::Worktree,
    ) -> Result<zed::Command> {
        let path = PathBuf::from("/home/jk/abl-language-server/target/debug/abl-language-server");

        let mut env = HashMap::new();
        env.insert("RUST_LOG".to_string(), "debug".to_string());

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
        target_id: &zed::LanguageServerId,
        _: &zed::Worktree,
    ) -> Result<Option<serde_json::Value>> {
        Ok(None)
    }
}

zed::register_extension!(AblExtension);
