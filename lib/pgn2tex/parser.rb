
module Pgn2tex
  # Interface class to Treetop Parser
  class Parser
    def initialize
      @parser = Pgn2texParser.new
    end

    # Parse pgn string to Database
    # @return [Database]
    def parse_pgn(pgn)
      @parser.parse(pgn)
    end

    # @return [Pgn2texParser] the treetop parser object
    def parser
      @parser
    end
  end
end
