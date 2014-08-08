module Pgn2tex
  class Database < Node
    # @return [Array] all {Pgn2tex::Game} objects in the database
    def games
      elements
    end

    # Add games in another database to this database
    # @param other_database [Pgn2tex::Database] The database with games to add
    # @return [Array<Pgn2tex::Game>] All games
    def merge!(other_database)
      games << other_database.games
    end

    def inspect
      "<Database of #{games.count} chess game(s).>\n" + games.map{|g| "\t#{g.inspect}\n"}.join
    end
  end
end
