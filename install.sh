#!/bin/sh

cd ~
git clone --no-checkout git://github.com/godfat/dev-tool.git
mv dev-tool/.git .
rmdir dev-tool
git reset --hard
git config prompt.hide true
