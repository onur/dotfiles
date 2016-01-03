#!/usr/bin/perl

use strict;
use warnings;

use Irssi;
use vars qw/$VERSION %IRSSI/;

$VERSION = "0.1";
%IRSSI = (
  author => 'Onur Aslan',
  contact => 'onur@onur.im',
  name => '.quote for ygz',
  description => 'yazan adamin dedigi biseyi getirir',
  license => 'MIT',
  url => 'http://onur.im/'
);


sub get_quote {
    my $nick = $_[0] or return;
    my @args = (
        'egrep',
        "'<.$nick>'",
        '\'/home/onur/.irssi/irclogs/freenode/#ygz.log \'',
        '|',
        'shuf',
        '|',
        'head -1',
        '|',
        'sed',
        '\'s/.*> \(.*\)$/\1/\''
    );
    chomp(my $rep = `@args`);
    return $rep;
}

sub quote {
  my ($server, $msg, $nick, $address, $target) = @_;
  return unless $msg =~ /^.q(uote)?$/;
  return unless $target eq '#ygz';

  my $rep = get_quote($nick);
  $server->command('msg ' . $target . ' ' . $nick . ': ' . $rep);
}

sub quote_own {
  my ($server, $msg, $target) = @_;
  return unless $msg =~ /^.q(uote)?$/;
  return unless $target eq '#ygz';

  # FIXME: I can get my nickname from irssi
  my $rep = get_quote('onur');
  $server->command('msg ' . $target . ' onur: ' . $rep);
}

Irssi::signal_add("message public", "quote");
Irssi::signal_add("message own_public", "quote_own");
