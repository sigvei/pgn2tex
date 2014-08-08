require "date"

module Pgn2tex
  # A game represents the entire PGN game. There may be several 
  # Game objects in one Database object. The game consists of
  # metadata and moves.
  class Game < Node
    # Get metadata from the PGN tag pairs
    # @return [Hash] retadata
    def metadata
      @metadata || @metadata = if respond_to? :tag_pairs
        tag_pairs.to_hash
      else
        { }
      end
    end

    # Get the full moves of the game, including annotations, comments
    # and so on.
    # @return [Array<PGN::FullMove>]
    def moves
      movetext.elements.first.elements.map &:move
    end

    # @return [String] white player's name, or "?" (in accordance with PGN spec).
    def white
      metadata["White"] || "?"
    end
    
    # (see #white)
    def black
      metadata["Black"] || "?"
    end

    # @return [String] a string representation of the players' names
    def names
      white + " vs. " + black
    end

    # Results might be given in metadata or in the movetext, or both.
    # Metadata results have priority (for efficiency). Either way,
    # the result object (a string or a SyntaxNode) is extended with
    # {Pgn2tex::Result}.
    # @return [Result] the result
    def result
      result_from_metadata || result_from_movetext
    end

    # @return [String] location of game, from metadata. If not given, "?"
    def site
      metadata["Site"] || "?"
    end

    # @return [Date,nil] Date of game, from metadata, or nil if unparseable
    def date
      if metadata["Date"]
        begin
          Date.parse(metadata["Date"])
        rescue ArgumentError
          nil
        end
      else
        nil
      end
    end

    # @return [String,Numeric] Year of game, if given and parseable, or "?"
    def year
      date.nil? ? "?" : date.year
    end

    def inspect
      "<" + [names, result, (year || "?").to_s, site].join("\t") + ">"
    end

    private

    def result_from_metadata
      if metadata["Result"]
        metadata["Result"].extend Result
      else
        nil
      end
    end

    def result_from_movetext
      if movetext.elements.last.is_a? Result
        movetext.elements.last
      else
        nil
      end
    end
  end
end
