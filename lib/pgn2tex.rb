require "pgn2tex/version"
require "treetop"
require "pgn2tex/nodetypes"
require "pgn2tex/parser"

#  This grammar gets loaded into namespace
Treetop.load File.join(File.dirname(File.expand_path(__FILE__)), "pgn2tex/pgn_grammar.tt")

module Pgn2tex
end
