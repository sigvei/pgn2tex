module Pgn2tex
  class Variant < Node
    # (see Game#moves)
    def moves
      movetext.elements.first.elements.map &:move
    end
  end
end
