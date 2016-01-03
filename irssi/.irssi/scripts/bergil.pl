#!/usr/bin/perl


use strict;
use warnings;

use Irssi;
use vars qw/$VERSION %IRSSI/;

$VERSION = "0.1";
%IRSSI = (
  author => 'Onur Aslan',
  contact => 'onur@onur.im',
  name => 'bergilbot',
  description => 'iyi',
  license => 'MIT',
  url => 'http://onur.im/'
);




my $last_time_said_iyi = 0;
sub iyi {
  my $t = time();
  my $timeout = Irssi::settings_get_int("bergilbot_iyi_timeout");

  if ($timeout < 0) {
    return;
  }

  if ($last_time_said_iyi + $timeout <= $t) {
    $last_time_said_iyi = $t;
    return "iyi\n";
  }
}


sub bergil {
  my ($server, $msg, $nick, $address, $target) = @_;
  return unless $nick eq 'MuratBergil';

  my $content = '';

  $content .= iyi();


  return unless $content;

  my @contents = split(/\n/, $content);

  for my $c (@contents) {
    $server->command('msg ' . $nick . ' ' . $content);
  }
}


Irssi::settings_add_int($IRSSI{name}, 'bergilbot_iyi_timeout', -1);


Irssi::signal_add("message private", "bergil");
