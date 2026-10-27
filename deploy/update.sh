#!/bin/bash
#
# Publish the current checkout in the production site, in the raw/ subdir
# of the django app; it is served as is by django, so no restart is needed.
#
# Called by r2lab-embedded/services/run-updates.sh after it has moved this
# repo to the latest origin commit; can also be run by hand to force a redeploy.
# The git update itself is NOT done here, since resetting a repo under a
# running script is unsafe.
#
# This is the counterpart of r2lab.inria.fr/deploy/update.sh, that
# publishes everything else but leaves raw/ alone.
#

set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")/.."

rsync -ai --exclude .git --delete --delete-excluded ./ /var/www/r2lab.inria.fr/django/raw/
