# Data Analyst Portfolio Website (Pelican)

This is a starter template for a Data Analyst Portfolio website built using [Pelican](https://getpelican.com/), a static site generator powered by Python.

## Project Structure

```
.
├── content/                # Your website's content
│   ├── portfolio/          # Portfolio project Markdown files
│   │   └── sample-project-1.md
│   └── pages/              # Static pages (e.g., about.md)
│   └── images/             # Optional: images used in your content
├── output/                 # Where the generated HTML website will be stored (usually .gitignored)
├── theme/                  # Your custom theme
│   ├── templates/          # HTML templates
│   │   ├── base.html       # Base template for all pages
│   │   ├── article.html    # Template for individual portfolio projects
│   │   └── index.html      # Template for the main portfolio listing page
│   └── static/
│       └── css/
│           └── style.css   # Basic stylesheet
├── Makefile                # For easy management (build, serve, etc.)
├── pelicanconf.py          # Main Pelican configuration file
├── publishconf.py          # Optional: Pelican configuration for publishing (not created in this initial setup)
└── README.md               # This file
```

## Prerequisites

*   Python 3.x
*   Pip (Python package installer)

## Setup & Installation

1.  **Clone the repository (if applicable):**
    ```bash
    git clone <repository-url>
    cd <repository-name>
    ```

2.  **Create a virtual environment (recommended):**
    ```bash
    python3 -m venv venv
    source venv/bin/activate  # On Windows use `venv\Scripts\activate`
    ```

3.  **Install Pelican and Markdown:**
    ```bash
    pip install pelican markdown
    ```
    You might also want `ghp-import` if deploying to GitHub Pages:
    ```bash
    pip install ghp-import
    ```

## Usage

### Adding Content

*   **Portfolio Projects:** Create new Markdown files (`.md`) in the `content/portfolio/` directory. See `content/portfolio/sample-project-1.md` for an example structure.
    *   **Metadata:** Each file should start with metadata like `Title`, `Date`, `Summary`, and `Category`.
*   **Static Pages:** Create Markdown files in the `content/pages/` directory (e.g., `about.md`, `contact.md`).
    *   Example `content/pages/about.md`:
        ```markdown
        Title: About Me
        Date: 2023-01-01

        This is the about page.
        ```
        This will be accessible at `/pages/about.html`.

### Building the Website

To generate the HTML site from your Markdown content:
```bash
make html
```
Or directly using Pelican:
```bash
pelican content -o output -s pelicanconf.py
```
The generated website will be in the `output/` directory.

### Serving Locally for Development

To build the site and start a local webserver with auto-reload (rebuilds when content changes):
```bash
make serve
```
Or (for just serving, after `make html`):
```bash
make devserver
```
Then open your browser to `http://localhost:8000` (or the port specified in the Makefile/console).

### Publishing

A `publishconf.py` (not included in this initial setup) is typically used for production settings (e.g., setting the final `SITEURL`, enabling analytics).

To build for publishing (assuming `publishconf.py` exists):
```bash
make publish
```

The `Makefile` also contains example targets for deploying via SSH, rsync, S3, GitHub Pages, etc. You'll need to configure these for your specific hosting setup. For GitHub Pages, you would typically use the `make github` target after installing `ghp-import`.

## Customization

*   **Theme:** Modify HTML templates in `theme/templates/` and CSS in `theme/static/css/style.css`.
*   **Configuration:** Adjust site settings in `pelicanconf.py` (and `publishconf.py` for production).
*   **Pelican Plugins:** Extend functionality by adding Pelican plugins.

## Contributing

Feel free to fork this template and adapt it for your own needs.

```
