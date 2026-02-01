use zed_extension_api::{self as zed, Result};

pub fn init() -> Result<()> {
    zed::register_language("viper", "Viper");

    // Configure the language with tree-sitter grammar
    zed::register_language_server(
        "viper-lsp",
        "Language server for Viper",
        zed::LanguageServerInstallationStatus::None,
    );

    Ok(())
}