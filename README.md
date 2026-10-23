<p align="center">
  <img src="site/img/logo.png" alt="" width="80" height="70"><br>
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="site/img/wordmark-light.png">
    <img src="site/img/wordmark.png" alt="" width="258" height="42">
  </picture>
</p>

<h1 align="center">CancerWatch Quality Tool</h1>

<p align="center"><b>Quality assurance for European cancer registry data</b></p>

<p align="center">Validate registry submissions against the ENCR protocol rules before you send them to ECIS:<br>errors, warnings and data-quality indicators in a single run, entirely on your own computer.</p>

<p align="center"><b><a href="https://ncri-it.github.io/CancerWatch-Quality-Tool-Releases/">Download the CancerWatch Quality Tool</a></b></p>

## Download

| Windows | macOS | Linux |
|:---:|:---:|:---:|
| **[Download for Windows](https://github.com/ncri-it/CancerWatch-Quality-Tool-Releases/releases/latest/download/ECIS.CancerWatchQualityTool-win-Setup.exe)** | Coming soon | **[Download for Linux](https://github.com/ncri-it/CancerWatch-Quality-Tool-Releases/releases/latest/download/ECIS.CancerWatchQualityTool.AppImage)** |
| Windows 10 or 11, 64-bit, no administrator rights needed | macOS 14 Sonoma or later, signed and notarised | AppImage, Ubuntu 22.04 or later and other glibc distributions |

> [!NOTE]
> The macOS version is in preparation. The [download page](https://ncri-it.github.io/CancerWatch-Quality-Tool-Releases/) shows which versions are available and is always current for the latest release; all versions and their release notes are under [Releases](https://github.com/ncri-it/CancerWatch-Quality-Tool-Releases/releases).

- Patient data never leaves your computer
- No internet connection required
- Free and open source, EUPL 1.2 licence

## What it is

CancerWatch is a Joint Action supporting Europe's Beating Cancer Plan. Its primary goal is to
improve the quality and timeliness of cancer registry data collected by the members of the
European Network of Cancer Registries. By innovating registration processes and addressing data
disparities, CancerWatch will make more accurate and comparable insights available through the
[European Cancer Information System (ECIS)](https://ecis.jrc.ec.europa.eu/) and the new
[European Health Data Space](https://health.ec.europa.eu/ehealth-digital-health-and-care/european-health-data-space-regulation-ehds_en).

The Quality Tool is intended for population-based cancer registries that submit data to ECIS. It
is downloaded and run on the user's own computer, with no internet connection, to assess a data
file before submission and to feed performance indicators back into the registry's overall data
quality work. A Getting Started guide inside the tool explains how to prepare a file.

For more about the Joint Action, visit [cancerwatch.eu](https://cancerwatch.eu/).

## System requirements

The hardware requirements, and the operating-system notes for Windows, macOS and Linux, are on the
[download page](https://ncri-it.github.io/CancerWatch-Quality-Tool-Releases/#requirements).

## Help and feedback

Questions, problems and accessibility feedback: [cancerwatch@ncri.ie](mailto:cancerwatch@ncri.ie).
The tool's own Contact Support page prepares a diagnostics file to attach.

---

## The download page

The public download page at https://ncri-it.github.io/CancerWatch-Quality-Tool-Releases/ is the
static site in `site/`: plain HTML and CSS, no framework, no build step beyond filling in the
release details. `site/index.html` is a template. It carries five placeholders,
`{{VERSION}}`, `{{RELEASE_DATE}}`, `{{WINDOWS_SIZE}}`, `{{MACOS_SIZE}}` and `{{LINUX_SIZE}}`,
and the three download buttons link to the fixed `releases/latest/download/<asset>` URLs, so
the page never needs editing for a new release.

### Deploying

The _Deploy download page_ workflow (`.github/workflows/deploy-pages.yml`) reads the latest
published release with `gh api`, fills the placeholders through `scripts/build-page.sh`, and
deploys the result to GitHub Pages. The repository's Pages source is set to _GitHub Actions_
(Settings, then Pages), which only the repository owner's account can change. The workflow runs
on manual dispatch; the `release: published` trigger is commented out in the workflow and is to be
enabled once the live page is signed off. The latest-release lookup can lag a publish by about a minute,
so a dispatch straight after publishing may fail once; run it again. The workflow fails if the
Windows or Linux installer is missing from the latest release. The macOS installer is optional:
while a release has none, the build keeps the "Coming soon" slot in the template (the block
between the `MACOS_COMING` markers) instead of the download button (the `MACOS_AVAILABLE`
block), and the button appears automatically on the first deploy after a release carries the file.

To preview locally, build with any values and serve the output folder. Leave `MACOS_SIZE` out
to see the coming-soon state:

```bash
VERSION=2.1.1 RELEASE_DATE="12 Oct 2026" WINDOWS_SIZE="98 MB" LINUX_SIZE="104 MB" MACOS_SIZE="101 MB" bash scripts/build-page.sh site build
```

### Updating the screenshots

The eight screenshots live in `site/img/shot-*.png`, each 1426 x 742 pixels, captured from the
application window in the light theme. To update one, replace the file under the same name and
check the `alt` text and caption in `site/index.html` still describe it. Every screenshot must
show synthetic data only: no real patient, tumour or registry identifiers. Rendered previews of
the whole page are not kept in the repository.

### Other notes

- Fonts: the same two Roboto files the application ships (variable weight 300 to 700, latin and
  latin-ext) are self-hosted under `site/fonts/` (SIL Open Font License,
  `site/fonts/LICENSE.txt`). The page makes no third-party requests.
- The support address, cancerwatch@ncri.ie, appears twice in `site/index.html`, in the
  statement and the footer.
- The accessibility statement at the foot of the page carries the date it was last reviewed.
  Re-check it whenever the page changes.

---

<p align="center"><img src="site/img/eu-mark.png" alt="Co-funded by the European Union" width="195" height="47"></p>

<p align="center">Developed by the National Cancer Registry Ireland for the CancerWatch Joint Action.<br>Licensed under the <a href="https://interoperable-europe.ec.europa.eu/collection/eupl/eupl-text-eupl-12">European Union Public Licence, EUPL 1.2</a>.</p>
