require File.dirname(__FILE__) + "/../.debian_7/session.rb"

iso = "debian-live-7.0.0-i386-standard.iso"

session =
  DEBIAN_7_SESSION.merge(:os_type_id => 'Debian',
                        :iso_file => iso,
                        :iso_md5 => "b504de07da1311d6022680899d1f33d1",
                        :iso_src => "http://cdimage.debian.org/debian-cd/7.0.0-live/i386/iso-hybrid/#{iso}")

Veewee::Session.declare session
