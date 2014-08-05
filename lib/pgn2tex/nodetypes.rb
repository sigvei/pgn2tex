require "date"
require "erb"

module PGN
  module TexTemplate
    def class_name
      self.class.name.split("::").last
    end

    def to_tex
      filename = File.join(File.dirname(__FILE__), "templates", class_name + ".tex.erb")
      template = File.read(filename)
      ERB.new(template).result(binding)
    end
  end

  class Node < Treetop::Runtime::SyntaxNode
    include TexTemplate
  end

  class Database < Node
    def games
      elements
    end

    def inspect
      "<Database of #{games.count} chess game(s).>\n" + games.map{|g| "\t#{g.inspect}\n"}.join
    end
  end

  class Game < Node
    def metadata
      @metadata || @metadata = if respond_to? :tag_pairs
        tag_pairs.to_hash
      else
        { }
      end
    end

    def moves
      movetext
    end

    def white
      metadata["White"] || "?"
    end
    
    def black
      metadata["Black"] || "?"
    end

    def names
      white + " vs. " + black
    end

    def result
      metadata["Result"] || "*"  # Add finding result from movetext
    end

    def site
      metadata["Site"] || "?"
    end

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

    def year
      date.nil? ? "?" : date.year
    end

    def inspect
      "<" + [names, result, (year || "?").to_s, site].join("\t") + ">"
    end
  end
  
  class Tags < Node
    # Gets the tags from the tag pair syntax node, 
    # which includes spaces
    def tags
      elements.map do |elm|
        elm.elements.select {|e| e.is_a? Tag}
      end.flatten
    end

    def to_hash
      tags.inject({}) do |hash, tag|
        hash.merge( tag.key_pair )
      end
    end
  end

  class Tag < Node
    def key_pair
      Hash[tag_name.text_value, tag_data.text_value]
    end
  end

  class TagName < Node
  end

  class StringLiteral < Node
  end


  class Moves < Node
  end

  class FullMove < Node
  end

  class MoveNumberIndicator < Node
  end

  class HalfMove < Node
  end

  class SAN < Node
  end

  class Variant < Node
  end
  
  class Comment < Node
  end
end
