require "pgn2tex/version"
require "treetop"

# Modules
require "pgn2tex/texable"
require "pgn2tex/result"

# Elements/nodes of parsing
require "pgn2tex/node"
require "pgn2tex/database"
require "pgn2tex/game"
require "pgn2tex/tags"
require "pgn2tex/tag"
require "pgn2tex/tag_name"
require "pgn2tex/string_literal"
require "pgn2tex/moves"
require "pgn2tex/full_move"
require "pgn2tex/move_number_indicator"
require "pgn2tex/half_move"
require "pgn2tex/san"
require "pgn2tex/variant"
require "pgn2tex/nag"
require "pgn2tex/comment"

# The parser interface
require "pgn2tex/parser"

#  This grammar gets loaded into namespace
Treetop.load File.join(File.dirname(File.expand_path(__FILE__)), "pgn2tex/pgn_grammar.tt")

module Pgn2tex
end
