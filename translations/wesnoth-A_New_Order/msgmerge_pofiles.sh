#!/bin/sh

# The command to update the potfile is listed in TRANSLATORS.txt at the top lvl

for lang in ca cs da de en_GB en_US es fr hu it ja pl ru sv tr; do
  echo "merging translation for ${lang} with template..."
  msgmerge --previous --update --lang=${lang} ${lang}.po ../wesnoth-A_New_Order.pot
  if test -w . && test -r ${lang}.po && test -e ${lang}.po~; then
    if test -x "$(which rmtrash)"; then
      rmtrash ${lang}.po~
    elif test -w ~/.Trash; then
      mv ${lang}.po~
    else
      rm -f ${lang}.po~
    fi
  fi
  msgfmt -o ${lang}.mo ${lang}.po
done
if test -e ~/Downloads/ANO_thread_attachments/wesnoth-A_New_Order.pot; then
  cd ..
  diff -u ~/Downloads/ANO_thread_attachments/wesnoth-A_New_Order.pot wesnoth-A_New_Order.pot > potfile.diff
fi
