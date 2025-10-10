#!/bin/bash
# --- CONFIG ---
SCRIPT_NAME="search"
SRC_FILE="search.cpp"
INSTALL_DIR="$HOME/.local/bin"
TARGET="$INSTALL_DIR/$SCRIPT_NAME"

echo "🚀 Installing $SCRIPT_NAME ..."
if ! command -v g++; then
	echo "g++ not found. Please install it first"
	exit 1
else 
	echo "✅ g++ found"
fi
mkdir -p "$INSTALL_DIR"
echo "🔧 Compiling $SRC_FILE ..."
g++ "$SRC_FILE" -o "$TARGET"
chmod +x "$TARGET"
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo "export PATH=\"\$HOME/.local/bin:\$PATH\"" >> "$HOME/.bashrc"
    echo "✅ Added $INSTALL_DIR to PATH. Restart your terminal or run: source ~/.bashrc"
fi
echo "✅ Installation complete!"
echo "You can now run:  $SCRIPT_NAME <platform> <query>"

