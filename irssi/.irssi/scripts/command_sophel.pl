#!/usr/bin/perl


use strict;
use warnings;

use Irssi;
use vars qw/$VERSION %IRSSI/;

$VERSION = "0.1";
%IRSSI = (
  author => 'Onur Aslan',
  contact => 'onur@onur.im',
  name => 'commend sophel',
  description => 'tell sophel to command',
  license => 'MIT',
  url => 'http://onur.im/'
);



sub command {
  my ($server, $msg, $nick, $address, $target) = @_;
  return unless $nick eq 'command';
  return unless $msg eq '!kill';

  $server->command('msg ' . $target . ' ' . $nick . ': sopel\'i kapattim command!');
}


Irssi::signal_add("message public", "command");
