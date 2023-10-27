# Print a message indicating the start of the dependency installation process
printf "Installing Ubuntu dependencies\n"

# Install necessary build tools and utilities via apt-get
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen ripgrep -y

# Print a message indicating the start of the Neovim cloning process
echo "cloning neovim"

# Clone the Neovim repository from GitHub
git clone https://github.com/neovim/neovim.git

# Print a message indicating the start of the Neovim installation process
printf "Installing neovim\n"

# Change the current directory to the cloned neovim directory
cd neovim

# Checkout the specified release branch (release-0.7 in this case)
git checkout release-0.7

# Build Neovim with the Release build type
make CMAKE_BUILD_TYPE=Release

# Install the built Neovim binaries to the system
sudo make install

# Print a message indicating the start of the Neovim configuration cloning process
printf "Pulling nvim config\n"

# Clone a Neovim configuration repository from GitHub into the ~/.config/nvim directory
git clone https://github.com/zshobbs/nvim.git ~/.config/nvim

# Print a message indicating the start of the additional installation process
printf "Installing additional required packages\n"

# Install pynvim via pip
pip install pynvim

# Check if Node.js is installed and install it if not
if ! command -v node &> /dev/null
then
    printf "Node.js not found, installing...\n"
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt-get install -y nodejs
else
    printf "Node.js is installed\n"
fi

# Install neovim npm package globally
sudo npm i -g neovim

# Print instructions for the user on how to add a new Language Server Protocol (LSP) to Neovim
printf "To add a new LSP\n\nFirst Enter:\n:LspInstallInfo\nand press i on the Language Server you wish to install\n"

