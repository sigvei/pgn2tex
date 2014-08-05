# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pgn2tex/version'

Gem::Specification.new do |spec|
  spec.name          = "pgn2tex"
  spec.version       = Pgn2tex::VERSION
  spec.authors       = ["Sigve Indregard"]
  spec.email         = ["sigve@indregard.no"]
  spec.summary       = %q{Converts a PGN chess game to LaTeX.}
  spec.description   = %q{Chess games, with annotation and commentary, are shared in the Portable Game Notation (PGN) format. This Gem converts such files to LaTeX documents, using the TeXMate package for formatting.}
  spec.homepage      = "http://github.com/sigvei/pgn2tex"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "treetop", "~> 1.5.0"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
