require File.dirname(__FILE__) + "/../.debian_6/session.rb"

iso = "debian-6.0.0-i386-netinst.iso"

session =
  DEBIAN_SESSION.merge( :iso_file => iso,
                        :iso_md5 => "2840eea06e9cdd2e125f32cefa25fa1d",
                        :iso_src => "http://ftp.sunet.se/pub/Linux/distributions/debian-cd/6.0.0/i386/iso-cd/#{iso}")

Veewee::Session.declare session
