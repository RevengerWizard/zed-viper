use zed_extension_api as zed;

struct ViperExtension;

impl zed::Extension for ViperExtension {
    fn new() -> Self {
        ViperExtension
    }
}

zed::register_extension!(ViperExtension);
