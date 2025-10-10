# 🧭 Terminal Searcher 🔍

Search the web directly from your **terminal** — fast, simple, and convenient!

Easily open search results in your default browser for platforms like Google, YouTube, GitHub, and Stack Overflow.

---

## 🚀 Usage

```bash
search <platform> <your query>
```

### 🔸 Examples

```bash
# Google Search
search google how to make chocolate cake
search google python tutorials

# YouTube Search
search youtube machine learning tutorials
search youtube music videos

# GitHub Search
search github rust projects
search github docker examples

# Stack Overflow Search
search stackoverflow fix segmentation fault
search stackoverflow javascript array methods
```

You can also wrap multi-word queries in quotes:

```bash
search google "how to fix error 404 in nginx"
```

---

## 🌐 Supported Platforms

| Platform          | Description                  |
| ----------------- | ---------------------------- |
| **google**        | Search the web via Google    |
| **youtube**       | Search videos on YouTube     |
| **github**        | Search repositories/code     |
| **stackoverflow** | Search programming questions |

---

## ⚙️ Features

✅ Lightweight and written in C++
✅ Works on any Linux distribution
✅ Opens results instantly in your default browser
✅ Simple `.sh` installer script for global use
✅ Automatically adds itself to your PATH

---

## 💾 Installation

### 🧩 Automatic (Recommended)

Clone the repository and run the installer:

```bash
git clone https://github.com/mostafa-mesbah/Terminal-Searcher.git
cd Terminal-Searcher
./install.sh
```

Then restart your terminal or run:

```bash
source ~/.bashrc
```

Now you can use the `search` command from anywhere! 🎉

---

### 🧰 Manual Installation

1. Compile the program manually:

   ```bash
   g++ search.cpp -o ~/.local/bin/search
   ```
2. Make it executable:

   ```bash
   chmod +x ~/.local/bin/search
   ```
3. Ensure your PATH includes `~/.local/bin`:

   ```bash
   export PATH="$HOME/.local/bin:$PATH"
   ```

---

## 🗑️ Uninstallation

To remove the command completely:

```bash
rm -f ~/.local/bin/search
```

(Optional) remove the PATH line from your `~/.bashrc` if it was added:

```bash
sed -i '/export PATH="\$HOME\/.local\/bin:\$PATH"/d' ~/.bashrc
```

---

## 🧠 Help

```bash
search --help
```

---

## 🧑‍💻 Author

**Mostafa Mesbah**
📍 Cairo, Egypt
🔗 [GitHub Profile](https://github.com/mostafa-mesbah)



