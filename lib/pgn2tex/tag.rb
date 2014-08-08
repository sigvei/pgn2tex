module Pgn2tex
  class Tag < Node
    # @return the tag name and data as a hash
    def key_pair
      Hash[tag_name.text_value, tag_data.text_value]
    end
  end
end
