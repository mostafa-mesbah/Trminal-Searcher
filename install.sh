#!/bin/bash
# --- CONFIG ---
SCRIPT_NAME="search"
SRC_FILE="search.cpp"
INSTALL_DIR="$HOME/.local/bin"
TARGET="$INSTALL_DIR/$SCRIPT_NAME"
BASH_COMPLETION_DIR="$HOME/.local/share/bash-completion"
BASH_COMPLETION_FILE="$BASH_COMPLETION_DIR/$SCRIPT_NAME"

echo "🚀 Installing $SCRIPT_NAME ..."

# Check for g++
if ! command -v g++ >/dev/null; then
    echo "❌ g++ not found. Please install it first."
    exit 1
else 
    echo "✅ g++ found"
fi

# Create install directory if it doesn’t exist
mkdir -p "$INSTALL_DIR"

# Compile the C++ file
echo "🔧 Compiling $SRC_FILE ..."
g++ "$SRC_FILE" -o "$TARGET"
chmod +x "$TARGET"

# Add ~/.local/bin to PATH if not already there
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo "export PATH=\"\$HOME/.local/bin:\$PATH\"" >> "$HOME/.bashrc"
    echo "✅ Added $INSTALL_DIR to PATH. Restart your terminal or run: source ~/.bashrc"
fi

# --- Auto-completion setup ---
echo "🧩 Setting up auto-completion ..."

# Create bash completion directory if missing
mkdir -p "$BASH_COMPLETION_DIR"

# Write the auto-completion script
cat > "$BASH_COMPLETION_FILE" <<'EOF'
#!/bin/bash
_search_completions() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    local platforms="google youtube github stackoverflow"

    # If completing the first argument (the platform)
    if [[ $COMP_CWORD -eq 1 ]]; then
        COMPREPLY=( $(compgen -W "$platforms" -- "$cur") )
    fi
}

complete -F _search_completions search
EOF

# Make it executable
chmod +x "$BASH_COMPLETION_FILE"

# Ensure it's sourced automatically in .bashrc
if ! grep -q "$BASH_COMPLETION_FILE" "$HOME/.bashrc"; then
    echo "source \"$BASH_COMPLETION_FILE\"" >> "$HOME/.bashrc"
    echo "✅ Added auto-completion source to .bashrc"
fi

echo "✅ Installation complete!"
echo "You can now run:  $SCRIPT_NAME <platform> <query>"
echo "✨ Tip: Try auto-complete with → search [TAB]"
