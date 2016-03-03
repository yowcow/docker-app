use strict;
use warnings;
use Hoge;
use Mojolicious::Lite;

get '/' => sub {
    my $c = shift;
    $c->stash({
        message => Hoge->hello,
    });
} => 'root';

app->start;

__DATA__

@@ root.html.ep
<!doctype html>
<html>
<body>
  <h1><%= $message %></h1>
</body>
</html>
