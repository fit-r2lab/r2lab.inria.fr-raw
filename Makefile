# the script to apply git changes in production site r2lab.inria.fr
# invoked every 10 minutes from cron through pull-and-restart.sh
# which does make publish

PUBLISH-PATH = /var/www/r2lab.inria.fr/raw/
EXCLUDES = .git
RSYNC-EXCLUDES = $(foreach exc,$(EXCLUDES), --exclude $(exc))

########## mirror this contents 
publish:
	rsync -av $(RSYNC-EXCLUDES) --delete --delete-excluded ./ $(PUBLISH-PATH)/

