require File.dirname(__FILE__) + "/../.debian_7/session.rb"

iso = "debian-7.0.0-amd64-netinst.iso"

session =
  DEBIAN_7_SESSION.merge(:os_type_id => 'Debian',
                        :iso_file => iso,
                        :iso_md5 => "6a55096340b5b1b7d335d5b559e13ea0",
                        :iso_src => "http://cdimage.debian.org/debian-cd/7.0.0/amd64/iso-cd/#{iso}")

Veewee::Session.declare session
