require File.dirname(__FILE__) + "/../.debian_7/session.rb"

iso = "debian-7.1.0-i386-netinst.iso"

session =
  DEBIAN_7_SESSION.merge(:os_type_id => 'Debian',
                        :iso_file => iso,
                        :iso_md5 => "a70efb67ca061175eabe7c5dc04ab323",
                        :iso_src => "http://cdimage.debian.org/debian-cd/7.1.0/i386/iso-cd/#{iso}")

Veewee::Session.declare session
