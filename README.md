# CancerWatch Quality Tool Releases
<img width="1017" height="620" alt="image" src="https://github.com/user-attachments/assets/99a8a8aa-df71-4846-8787-91b6acf362f3" />

## What is CancerWatch?
CancerWatch is a Joint Action supporting Europe’s Beating Cancer Plan. Its primary goal is to improve the quality and timeliness of cancer 
registry data collected by the members of European Network of Cancer Registries. By innovating registration processes and addressing data 
disparities, CancerWatch will make more accurate and comparable insights available through the 
[European Cancer Information System (ECIS)](https://ecis.jrc.ec.europa.eu/) and the new 
[European Health Data Space](https://www.european-health-data-space.com/). Ultimately, this initiative will enhance our understanding of 
cancer trends and support more effective cancer policies and research across Europe.

For more information on CancerWatch, visit the official website: https://cancerwatch.eu/

## What is the CancerWatch Quality Tool?
This is a tool intended for use in population-based cancer registries that submit data to ECIS. 

<img width="1426" height="742" alt="image" src="https://github.com/user-attachments/assets/497a9101-0817-410a-94ba-d36b638cbaf0" />

It can be downloaded and run on a user's computer, without connecting to the internet, to assess cancer data. This assessment involves
performance indicators which can be used to feed back into a registry's overall data quality.

<img width="1346" height="723" alt="image" src="https://github.com/user-attachments/assets/4e1868c2-243a-4fd5-acb6-0b140a70da23" />

A guide to getting started using this application is contained within the tool.

### Features
#### Security
- Personal identifiable data, such as patient health records, never leave the user's computer
- No requirement for an internet connection

#### Design/UI
- Light/dark mode toggle
- Resizeable page contents (zoom up to 200%)
- Built to
  - comply with [web content accessibility guidelines](https://www.w3.org/WAI/standards-guidelines/wcag/), v2.1
  - support keyboard-only navigation
  - work with modern screen reader and speech recognition software

### Hardware requirements
 
  | | Minimum | Recommended |
  | --- | --- | --- |
  | Processor | 64-bit x64, 2 cores | 4 or more cores. Validation runs in parallel across every core, so more cores make large files faster. |
  | Memory (RAM) | 4 GB (estimate) | 8 GB or more. The app runs three processes plus a web view, and holds up to 100k records in memory at a time. Memory use doesn't grow with file size. |
  | Disk space (for installation) | About 250 MB (estimate) | 1 GB |
  | Disk space (for everyday running) | Will vary with the size of the registry data. | At least 10 GB free. The largest file the app accepts (3 GB) needs 3×3 = 9 GB free. |
  | Display | 1280×720 | 1920×1080 |
  | Network | None needed. Everything runs on the local machine. The app only talks to itself over localhost, so security software must allow that. | Internet access only if you use the automatic update checks. |

### Software requirements
#### Windows
  - _Operating system:_ Windows 10 or Windows 11, 64-bit. Windows 10 is only realistic with Extended Security Updates, since mainstream support ended in October 2025.
  - _Microsoft Edge WebView2 Runtime:_ This comes as standard with Windows 11 and with up-to-date Windows 10.
  - _Permissions:_ no administrator rights needed, because the installer uses the PerUser location.

#### MacOS
  - _Operating system:_ macOS 14 (Sonoma) or later, the oldest version .NET 10 supports.
  - _Signing and notarisation:_ Apple Gatekeeper may block this app, to circumvent, users have to go through System Settings &LongRightArrow; Privacy & Security &LongRightArrow;
    Open Anyway.

#### Linux
  - _Distribution:_ a desktop distribution based on glibc that .NET 10 supports, for example Ubuntu [22.04](https://releases.ubuntu.com/jammy/) or [24.04](https://releases.ubuntu.com/noble/), [Debian](https://www.debian.org/distrib/)
    12 or later, [Fedora](https://fedoraproject.org/workstation/), [RHEL](https://developers.redhat.com/products/rhel/download) 8/9/10, or [openSUSE Leap 15.6](https://get.opensuse.org/leap/16.0/). Alpine and other musl-based
    distributions won't work, because the build targets glibc.
  - _Desktop session:_ a graphical desktop (X11 or Wayland). The app can't run on a headless server.
  - _Required packages:_
    - [libwebkit2gtk-4.1](https://packages.debian.org/sid/libwebkit2gtk-4.1-dev) and [GTK 3](https://www.gtk.org/docs/installations/linux), needed to draw the window (Ubuntu/Debian: libwebkit2gtk-4.1-0)
    - libicu, needed by .NET for regional formatting, because the app doesn't switch that feature off (Ubuntu/Debian: libicu74 or whichever version the distribution provides)
  - _AppImage:_ Velopack ships a Linux AppImage. Some distributions need FUSE 2 (libfuse2) to run AppImages, and newer Ubuntu releases don't install it by default. The file also has to be marked as executable (chmod +x).

### Installer for the latest version
| Operating System | Installer |
| --- | --- |
| Windows | Coming soon... |
| Linux | Coming soon... |
| Mac | Coming soon... |
