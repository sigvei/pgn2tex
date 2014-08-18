# Pgn2tex

Chess games are often published on the internet in Portable Game
Notation (PGN). PGN files may also include notation, comments and
variations.

Pgn2tex converts such files to LaTeX source code, ready to be
transformed into book-quality typeset games, with diagrams, figurine
notation and metadata information. Pgn2tex also handles PGN files
with multiple games, making it simple to publish an entire tournament,
series or league as a simple PDF.


## Installation

To use pgn2tex, you need ruby (> 1.9) and rubygems installed. Then
it is a simple matter of installing:

    gem install pgn2tex

To use it in your program, for instance to provide you with a fairly
good pgn parser, add this line to your application's Gemfile:

    gem 'pgn2tex'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pgn2tex

## Usage

From the command-line, execute

    $ pgn2tex -o [output file.tex] [input.pgn]


## Contributing

1. Fork it ( http://github.com/sigvei/pgn2tex/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
