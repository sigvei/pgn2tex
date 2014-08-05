module PGN
  class Database < Treetop::Runtime::SyntaxNode
    def games
      elements
    end

    def inspect
      "Database of #{games.count} chess game(s).\n" + games.map{|g| "\t#{g.inspect}\n"}.join
    end
  end

  class Game < Treetop::Runtime::SyntaxNode
    def metadata
      if respond_to? :tag_pairs
        tag_pairs.to_hash
      else
        { }
      end
    end

    def moves
      movetext
    end

    def white_name
      metadata["White"] || "?"
    end
    
    def black_name
      metadata["Black"] || "?"
    end

    def inspect
      white_name + " - " + black_name
    end
  end
  
  class Tags < Treetop::Runtime::SyntaxNode
    def to_hash
      elements.inject({}) do |hash, tag|
        hash.merge( tag.key_pair )
      end
    end
  end

  class Tag < Treetop::Runtime::SyntaxNode
    def key_pair
      Hash[tag_name.text_value, tag_data.text_value]
    end
  end

  class TagName < Treetop::Runtime::SyntaxNode
  end

  class StringLiteral < Treetop::Runtime::SyntaxNode
  end


  class Moves < Treetop::Runtime::SyntaxNode
  end

  class FullMove < Treetop::Runtime::SyntaxNode
  end

  class MoveNumberIndicator < Treetop::Runtime::SyntaxNode
  end

  class HalfMove < Treetop::Runtime::SyntaxNode
  end

  class SAN < Treetop::Runtime::SyntaxNode
  end

  class Variant < Treetop::Runtime::SyntaxNode
  end
  
  class Comment < Treetop::Runtime::SyntaxNode
  end

end
