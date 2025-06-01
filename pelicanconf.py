# Basic Pelican configuration

AUTHOR = 'A Data Analyst' # Replace with actual name
SITENAME = "Data Analyst Portfolio" # Replace with actual site name
SITEURL = '' # Set to your domain in production (e.g., 'https://www.example.com')

PATH = 'content' # Path to content directory (Markdown, reST files)
THEME = 'theme'  # Path to the theme directory we created

TIMEZONE = 'Europe/London' # Replace with your timezone, e.g., 'America/New_York'
DEFAULT_LANG = 'en'

# Feed generation is usually not desired for a portfolio site
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# URL settings for portfolio items (articles)
ARTICLE_PATHS = ['portfolio']  # Look for portfolio items in content/portfolio
ARTICLE_URL = 'portfolio/{slug}.html' # URL structure for portfolio items
ARTICLE_SAVE_AS = 'portfolio/{slug}.html' # Where to save the generated HTML

# URL settings for static pages (e.g., About Me)
PAGE_PATHS = ['pages']
PAGE_URL = 'pages/{slug}.html'
PAGE_SAVE_AS = 'pages/{slug}.html'

# We want the index.html to list our portfolio projects.
# `DIRECT_TEMPLATES` is used to specify which templates are rendered directly.
# 'index' will use `theme/templates/index.html` for the site's main index.
DIRECT_TEMPLATES = ['index']

# Static paths. Files here will be copied to the output directory.
# 'images' is a common one, but we haven't created it yet.
# 'extra' is a convention for things like robots.txt or CNAME if needed.
STATIC_PATHS = ['images'] # We'll need to create content/images if we use this
# For our CSS, Pelican automatically looks in THEME/static/
# If you had static files in `content/static`, you'd add 'static' to STATIC_PATHS.

# THEME_STATIC_DIR tells Pelican the name of the static directory in your theme.
# This is used by {{ THEME_STATIC_DIR }} in templates.
THEME_STATIC_DIR = 'static'


# Blogroll (example, can be removed or modified)
LINKS = (('Pelican', 'https://getpelican.com/'),
         ('Python.org', 'https://www.python.org/'),)

# Social widget (example, can be removed or modified)
SOCIAL = (('You can add links in your config file', '#'),
          ('Another social link', '#'),)

DEFAULT_PAGINATION = 5 # Number of items per page if pagination is used

# Uncomment following line if you want document-relative URLs when developing
# RELATIVE_URLS = True

# Plugins - if any are used, they would be listed here.
# For example: PLUGIN_PATHS = ['../pelican-plugins']
# PLUGINS = ['summary'] # Example if using a summary plugin

# --- Optional: Settings for how summaries are created ---
# If you don't use <!-- PELICAN_END_SUMMARY --> in your .md files,
# Pelican can auto-generate a summary.
# SUMMARY_MAX_LENGTH = 50 # Number of words

# --- Development settings ---
# To use a different output path in development vs production:
# import os # Make sure to import os if you use this
# if os.environ.get('PELICAN_ENV') == 'PRODUCTION':
#     SITEURL = 'https://your.production.site.url'
#     DELETE_OUTPUT_DIRECTORY = True
# else:
#     RELATIVE_URLS = True # Useful for local development
