module Pgn2tex
  module Result
    # Overrides the standard {Pgn2tex::Texable#to_tex} to provide
    # translation of PGN result strings to special TeXmate keywords.
    #
    # @return [String] LaTeX representation of result
    def to_tex
      val = respond_to?(:text_value) ? text_value : to_s
      case val
      when "1-0"
        "\\whitewins"
      when "0-1"
        "\\blackwins"
      when "1/2-1/2"
        "\\drawn"
      else
        ""
      end
    end
  end
end
