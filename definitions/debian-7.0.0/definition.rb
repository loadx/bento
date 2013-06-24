require File.dirname(__FILE__) + "/../.debian_7/session.rb"

iso = "debian-live-7.0.0-amd64-standard.iso"

session =
  DEBIAN_7_SESSION.merge(:os_type_id => 'Debian',
                        :iso_file => iso,
                        :iso_md5 => "f0e0f567c7f3f963f09e8b50098fb1e1",
                        :iso_src => "http://cdimage.debian.org/debian-cd/7.0.0-live/amd64/iso-hybrid/#{iso}")

Veewee::Session.declare session
