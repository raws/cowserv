CowServ is a Sinatra-powered web service which exposes the wonders of [cowsay](http://www.nog.net/~tony/warez/cowsay.shtml) to the world.

### Usage

CowServ requires that version 3.03 or higher of `cowsay` be available. Your package manager probably has a copy ready to go. You'll also need [Sinatra](http://www.sinatrarb.com/).

Start the service using `ruby cowserv.rb` or your preferred Sinatra deployment option.

Send a `GET` or `POST` request to CowServ with a `message` parameter:

    $ curl http://localhost:9876/?message=Hello%20world!
     ______________ 
    < Hello world! >
     -------------- 
            \   ^__^
             \  (oo)\_______
                (__)\       )\/\
                    ||----w |
                    ||     ||

You may also use many of the standard cowsay command-line switches:

    $ curl http://localhost:9876/?W=10&b&T=U&message=Hello%20world!
     ________ 
    / Hello  \
    \ world! /
     -------- 
            \   ^__^
             \  (==)\_______
                (__)\       )\/\
                 U ||----w |
                    ||     ||

The allowed switches are, in no particular order: `f, b, d, g, p, s, t, w, y, e, T` and `W`. See the [cowsay man page](http://pwet.fr/man/linux/commandes/cowsay) for details.

#### Cowfiles

For a list of currently-available cowfiles, visit `http://localhost:9876/list`. These cowfiles can be used with the `f` switch.

### About

CowServ was created by Ross Paffett, but would not be possible without the work of the creator of cowsay, Tony Monroe.

### License <small>(MIT)</small>

<small>Copyright © 2010 Ross Paffett.</small>

<small>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:</small>

<small>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.</small>

<small>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.</small>
