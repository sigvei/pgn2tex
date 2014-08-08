module Pgn2tex
  # Represents the set of tags in the tag-pair section
  class Tags < Node
    # Gets the tags from the tag pair syntax node,
    # removing the nodes representing just spaces.
    # @return [Array<Tag>] tags
    def tags
      elements.map do |elm|
        elm.elements.select {|e| e.is_a? Tag}
      end.flatten
    end

    # Converts tags to hash
    # @return [Hash] tags
    def to_hash
      tags.inject({}) do |hash, tag|
        hash.merge( tag.key_pair )
      end
    end
  end
end
