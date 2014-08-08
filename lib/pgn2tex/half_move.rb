module Pgn2tex
  # A half move is a single piece moved, by either black or white.
  # But a half move might also have addenda, that is, entire variants,
  # comments, annotations, or spaces.
  class HalfMove < Node
    # Does the half move have any addenda?
    def addenda?
      addenda.count > 0
    end

    # @return [Array<Variant,Comment>] Array of addenda, or an empty array
    def addenda
      if elements[1]
        elements[1].elements || []
      else
        []
      end
    end
  end
end
