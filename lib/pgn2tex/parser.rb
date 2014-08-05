
module Pgn2tex
  # Interface class to Treetop Parser
  class Parser
    def initialize
      @parser = PGNParser.new
    end

    def parse_pgn(pgn)
      @parser.parse(pgn)
    end
  end
end
