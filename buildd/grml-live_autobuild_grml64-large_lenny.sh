#!/bin/sh

# settings for grml_live_run:
DATE=$(date +%Y%m%d)
ISO_NAME=grml64_lenny_$DATE.iso
SUITE=lenny
CLASSES='GRMLBASE,GRML_FULL,LATEX_CLEANUP,RELEASE,AMD64'
NAME=grml64
SCRIPTNAME="$(basename $0)"
ARCH=amd64

. /usr/share/grml-live/buildd/functions.sh || exit 1

# execute grml-live:
grml_live_run

# create_logs
upload_logs

iso_details

send_mail

store_iso

if [ "$RC" = "0" ] ; then
   bailout
else
   echo "building ISO failed, keeping build files [${OUTPUT_DIR}]"
fi