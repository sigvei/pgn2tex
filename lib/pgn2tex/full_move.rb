module Pgn2tex
  # Represents a full move, that is, a move by both players.
  class FullMove < Node
    # @return [Array<HalfMove>] half moves
    def halfmoves
      # The syntax for half moves states that this is either
      # just a half move or a half move, a space, and a half move.
      # We want just the moves.
      raw = elements.last
      if raw.is_a? HalfMove
        [ raw ]
      elsif raw.elements.count == 3
        raw.elements.select {|e| e.is_a? HalfMove}
      end
    end
  end
end
