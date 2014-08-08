module Pgn2tex
  # Superclass for the terminal nodes of the syntax parsing.
  class Node < Treetop::Runtime::SyntaxNode
    include Texable
  end
end
