# NixOS Configuration Context

## 1. Arsitektur & Tech Stack

| Komponen | Framework / Tools | Detail & Lokasi |
|---|---|---|
| **Flake Engine** | `flake-parts` + `import-tree` | `flake.nix` otomatis memuat semua modul dalam `modules/` |
| **System Level** | NixOS Flakes | Output: `flake.nixosConfigurations.<hostname>` |
| **User Level** | Home Manager (Standalone)| Output: `flake.homeConfigurations."<user>@<hostname>"` |
| **Window Manager**| Niri (Wayland) | `home/features/niri/` |
| **Shell** | Zsh + Starship | `home/features/zsh.nix` |
| **Browser** | Firefox (Arkenfox) | `home/features/firefox.nix` |
| **Theme** | Catppuccin Mocha Mauve | `home/features/theme.nix` |

## 2. Struktur Direktori

Repositori ini menggunakan `import-tree` untuk auto-import semua modul secara dinamis dari struktur folder:

```text
myNixos/
├── flake.nix                  # Entrypoint: definisi inputs dan struktur dasar
├── flake.lock
├── agent/                     # Panduan/konteks khusus untuk AI
│   └── CONTEXT.md             
└── modules/                   # Semua file di sini di-import otomatis oleh import-tree
    ├── parts.nix              # Konfigurasi flake-parts
    ├── systems/               # Konfigurasi sistem (NixOS) tingkat OS (hw, services, network)
    ├── home/                  # Konfigurasi user (Home Manager) (dotfiles, theme, app user)
    ├── hosts/                 # Konfigurasi spesifik per mesin
    │   └── laptop/            # Hostname: seirios
    ├── _utils/                # Script utilitas dan helper
    └── _unmanaged/            # Modul/konfigurasi yang bersifat eksperimental atau unmanaged
```

## 3. Konvensi dan Aturan Penting

1. **Auto-Import (`import-tree`)**: 
   - Anda **tidak perlu** mengedit `flake.nix` untuk mendaftarkan modul baru secara manual. 
   - File `.nix` baru di dalam `modules/` akan terekspos secara otomatis.
2. **Namespace Option**: 
   - Konfigurasi biasanya diaktifkan menggunakan fungsi `lib.mkOption` dan `lib.mkIf cfg.enable`.
   - Prefix yang digunakan misalnya: `nixos.pipewire.enable`, `nixos.bluetooth.enable`.
3. **Pemisahan Modul System vs Home**: 
   - Jangan mencampuradukkan konfigurasi sistem dan user. 
   - **System** masuk ke direktori `systems/` (berlaku global).
   - **User** masuk ke direktori `home/` (berlaku untuk dotfiles/GUI si user).
4. **State Sistem Saat Ini**:
   - Hostname: `seirios`
   - User Account: `lann`
   - Target Arch: `x86_64-linux`

## 4. Perintah Build (Workflows)

- **Update NixOS System:** `sudo nixos-rebuild switch --flake /home/lann/myNixos/.`
- **Test NixOS System:** `sudo nixos-rebuild test --flake /home/lann/myNixos/.`
- **Update Home Manager:** `home-manager switch --flake /home/lann/myNixos/.`
