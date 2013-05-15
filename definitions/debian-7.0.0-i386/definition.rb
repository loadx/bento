require File.dirname(__FILE__) + "/../.debian_7/session.rb"

iso = "debian-7.0.0-i386-netinst.iso"

session =
  DEBIAN_7_SESSION.merge(:os_type_id => 'Debian',
                        :iso_file => iso,
                        :iso_md5 => "a6b93666a5393334accb7ac4ee28d949",
                        :iso_src => "http://server.local/ISOs/Debian/#{iso}")

Veewee::Session.declare session
