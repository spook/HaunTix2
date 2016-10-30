#!/usr/bin/perl -w

use strict;
use Data::Dumper;
use Gtk2 '-init';

my $window = Gtk2::Window->new;
$window->set_title('Simple Signals');

# signal 1, attached to the main window, when it is destroyed, 
#  clicked close button, <alt-f4>, etc., quit the main loop
$window->signal_connect(destroy => sub {Gtk2->main_quit;});

my $button = Gtk2::Button->new('Click Me To Quit');

# something to be passed by gtk to our signal handler, 
#  can be just about anything perl has to offer
my $user_data = 'Hello';

# signal 2, attached to the button, when the button is clicked this function
# is called.
$button->signal_connect(clicked => \&button_callback, $user_data);
$window->add($button);

$window->show_all;
Gtk2->main;

sub button_callback {

    # print out the parameters we were passed: (button, user_data)
    print Dumper (@_);

    # then quit
    Gtk2->main_quit;
    1;
}
