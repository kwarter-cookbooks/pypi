maintainer       "Kwarter, Inc"
maintainer_email "platforms@kwarter.com"
license          "Apache 2.0"
description      "Installs/Configures a pypi mirror"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends 'cron'
depends 'python'
recommends 'nginx'
