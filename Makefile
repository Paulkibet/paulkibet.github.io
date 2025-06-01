PY = python3
PELICAN = pelican
PELICANOPTS =

BASEDIR = $(CURDIR)
INPUTDIR = $(BASEDIR)/content
OUTPUTDIR = $(BASEDIR)/output
CONFFILE = $(BASEDIR)/pelicanconf.py
PUBLISHCONF = $(BASEDIR)/publishconf.py # We haven't created this yet, but it's standard

FTP_HOST = localhost
FTP_USER = anonymous
FTP_TARGET_DIR = /

SSH_HOST = localhost
SSH_USER = root
SSH_TARGET_DIR = /var/www

S3_BUCKET = my_s3_bucket

CLOUDFILES_USERNAME = my_rackspace_username
CLOUDFILES_API_KEY = my_rackspace_api_key
CLOUDFILES_CONTAINER = my_cloudfiles_container

DROPBOX_DIR = ~/Dropbox/Public/

GITHUB_PAGES_BRANCH = gh-pages

# Port for `make serve`
PORT = 8000
# Host for `make serve`
HOST = localhost


help:
	@echo "Makefile for a Pelican site"
	@echo ""
	@echo "Usage:"
	@echo "   make html                           (re)generate the web site"
	@echo "   make clean                          remove the generated files"
	@echo "   make regenerate                     regenerate files upon modification"
	@echo "   make serve [PORT=8000] [HOST=localhost]  serve site at http://HOST:PORT"
	@echo "   make serve-global [PORT=8000]       serve site at http://0.0.0.0:PORT"
	@echo "   make devserver [PORT=8000] [HOST=localhost]  (alias for 'serve' with autoreload)"
	@echo "   make publish                        generate using production settings (requires publishconf.py)"
	@echo ""
	@echo "   make ssh_upload                     upload the web site via SSH"
	@echo "   make rsync_upload                   upload the web site via rsync+ssh"
	@echo "   make dropbox_upload                 upload the web site via Dropbox"
	@echo "   make ftp_upload                     upload the web site via FTP"
	@echo "   make s3_upload                      upload the web site via S3"
	@echo "   make cf_upload                      upload the web site via Rackspace Cloud Files"
	@echo "   make github                         upload the web site via GitHub Pages"
	@echo ""

html:
	"$(PELICAN)" "$(INPUTDIR)" -o "$(OUTPUTDIR)" -s "$(CONFFILE)" $(PELICANOPTS)

clean:
	[ ! -d "$(OUTPUTDIR)" ] || rm -rf "$(OUTPUTDIR)"

regenerate:
	"$(PELICAN)" -r "$(INPUTDIR)" -o "$(OUTPUTDIR)" -s "$(CONFFILE)" $(PELICANOPTS)

serve:
	"$(PELICAN)" -lr "$(INPUTDIR)" -o "$(OUTPUTDIR)" -s "$(CONFFILE)" --listen --port $(PORT) --host $(HOST) $(PELICANOPTS)
	# Basic Python 3 server as a fallback or alternative:
	# (cd "$(OUTPUTDIR)" && "$(PY)" -m http.server $(PORT) --bind $(HOST))


serve-global:
	"$(PELICAN)" -lr "$(INPUTDIR)" -o "$(OUTPUTDIR)" -s "$(CONFFILE)" --listen --port $(PORT) --host 0.0.0.0 $(PELICANOPTS)

devserver: serve

publish:
	"$(PELICAN)" "$(INPUTDIR)" -o "$(OUTPUTDIR)" -s "$(PUBLISHCONF)" $(PELICANOPTS)

# Below are example upload methods. Customize them as needed.
# Ensure you have the necessary tools and configurations for these.

ssh_upload: publish
	scp -P 2222 -r "$(OUTPUTDIR)"/* example.com:/var/www

rsync_upload: publish
	rsync -e "ssh -p 2222" -Prcz --delete "$(OUTPUTDIR)/" example.com:/var/www

dropbox_upload: publish
	cp -r "$(OUTPUTDIR)"/* "$(DROPBOX_DIR)"/

ftp_upload: publish
	ncftpput -R -v -u "$(FTP_USER)" -p your_ftp_password "$(FTP_HOST)" "$(FTP_TARGET_DIR)" "$(OUTPUTDIR)"/*

s3_upload: publish
	# Example using aws s3 sync. Ensure AWS CLI is configured.
	aws s3 sync "$(OUTPUTDIR)/" "s3://$(S3_BUCKET)/" --delete --acl public-read

cf_upload: publish
	# Example using swift. May need swift anaconda package.
	# Ensure you have Rackspace Cloud Files credentials set up.
	# swift upload -u "$(CLOUDFILES_USERNAME)" -A "https://auth.api.rackspacecloud.com/v1.0" -K "$(CLOUDFILES_API_KEY)" "$(CLOUDFILES_CONTAINER)" "$(OUTPUTDIR)"/*

github: publish
	# This assumes your output directory is the root of your gh-pages branch
	# or you are using a tool like ghp-import
	ghp-import -m "Generate Pelican site" -b "$(GITHUB_PAGES_BRANCH)" "$(OUTPUTDIR)"
	# Alternatively, if OUTPUTDIR is your repo root for gh-pages:
	# cd "$(OUTPUTDIR)" && git add . && git commit -m "Publish website" && git push origin $(GITHUB_PAGES_BRANCH)


.PHONY: html help clean regenerate serve serve-global devserver publish ssh_upload rsync_upload dropbox_upload ftp_upload s3_upload cf_upload github
