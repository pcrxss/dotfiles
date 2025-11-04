if status is-interactive
    # Commands to run in interactive sessions can go here
# Disable Fish welcome message
set -g fish_greeting ""

end

# Add Flatpak binaries to PATH
set -x PATH $PATH $HOME/bin
set -x PATH $PATH /var/lib/flatpak/exports/bin
set -x PATH $PATH $HOME/.local/share/flatpak/exports/bin
