name 'role-base'
maintainer 'Andy Boutte'
maintainer_email 'andyboutte@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures role-base'
long_description 'Installs/Configures role-base'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'yum-epel', '~> 3.0.0'
depends 'magic_shell', '~> 1.0.0'