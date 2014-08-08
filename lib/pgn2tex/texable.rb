require "erb"

module Pgn2tex
  module Texable

    # Converts the object to LaTeX, by running an ERB template. Templates
    # need to be put in lib/pgn2tex/templates/, and be named <Class>.tex.erb, where
    # Class is the name of the class the Texable module is included in.
    #
    # Note that this method will likely be called only on top-level objects like
    # {Pgn2tex::Database}. The ERB templates for Database then calls {Pgn2tex::Game#to_tex}
    # object, and so on.
    # 
    # @return [String] A LaTeX representation of the object
    def to_tex
      filename = File.join(File.dirname(__FILE__), "templates", class_name + ".tex.erb")
      template = File.read(filename)
      @object = self
      ERB.new(template, 0, "-").result(binding)
    end

    # Escapes the string for inclusion in LaTeX files
    #
    # @param input [String] the string to escape
    # @return [String] the escaped string
    def texescape(input)
      input.gsub("#", "\\#")
    end
    module_function(:texescape)

    private

    def class_name
      self.class.name.split("::").last
    end
  end
end
