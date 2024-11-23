#!/bin/sh

# The command to update the potfile is listed in TRANSLATORS.txt at the top lvl

for lang in ca cs da de en_GB en_US es fr hu it ja pl ru sv tr; do
  echo "merging translation for ${lang} with template..."
  msgmerge --previous --update --lang=${lang} ${lang}.po ../wesnoth-A_New_Order.pot
  msgfmt -o ${lang}.mo ${lang}.po
done
if test -e ~/Downloads/ANO_thread_attachments/wesnoth-A_New_Order.pot; then
  cd ..
  diff -u ~/Downloads/ANO_thread_attachments/wesnoth-A_New_Order.pot wesnoth-A_New_Order.pot > potfile.diff
fi
