use std::process::Command;

fn main() {
    Command::new("make")
        .status()
        .expect("Failed to execute make");
    println!("cargo:rustc-link-search=.");
    println!("cargo:rustc-link-lib=static=lexer");
    println!("cargo:rustc-link-lib=dylib=fl");
}
