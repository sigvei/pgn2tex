require 'whittle'

module Pgn2tex
	# Parses PGN as a context-free grammar. Turns a file consisting of
	# zero or more PGN games into arrays of PGN games, each represented
	# by a hash with keys tags, moves and result.
	#
	# A «move» in this sense is either a simple (main line) move, a simple 
	# move with a text comment, or a simple move with a variation.
	# Variations, then, are arrays of move in the extended sense mentioned
	# above.
	#
	# A "simple" move is a text representation in SAN format, ie. h4,
	# Kxb5, R4d8+ and so on.
	class Parser < Whittle::Parser

		# Skip all whitespace
		rule(wsp: /\s+/).skip!

		start(:pgn_database)

		# A PGN database is either a pgn game or a pgn game and more pgn
		# games.
		rule(:pgn_database) do |r|
			r[].as { [] }
			r[:pgn_game, :pgn_database].as{|game, database| database << game}
		end

		# A PGN games consists of two sections. It should be converted
		# to a hash.
		rule(:pgn_game) do |r|
			r[:tag_section, :movetext_section].as do |tags, moves|
				{tags: tags, result: moves.pop, moves: moves}
			end
		end

		rule(:tag_section) do |r|
			r[:tag_pair, :tag_section].as {|pair, section| section.merge(pair)}
			r[:tag_pair]
		end

		rule(:tag_pair) do |r|
			r["[", :tag_name, :tag_value, "]"].as {|_, a, b, _| {a => b}}
		end

		rule(:tag_value) do |r|
			r[:string].as {|val| val[1..-1]}
		end

		rule(:movetext_section) do |r|
			r[:element_sequence, :game_termination].as do |a,b|
				a.reverse << b
			end
		end

		rule(:element_sequence) do |r|
			r[:element, :element_sequence].as do |element, sequence|
				if element.nil?
					sequence
				else
					sequence << element
				end
			end
			r[].as { [] }
		end

		rule(:element) do |r|
			r[:move_number_indication].as { nil }
			r[:annotated_move, :nag, :comments_and_variations].as do |san_move, ann, nag, cv|
				{move: san_move, annotation: ann, nag: nag, commentary: cv}
			end
			r[:san
		end

		rule(:annotated_move) do |r|
			r[:san_move, :annotation, :nag].as {|mv, ann| [mv, ann, nag]}
			r[:san_move, :annotation].as {|mv, ann| [mv, ann]}
			r[:san_move]
		end

		rule(:annotation => /[!\?]{1,2}/)
		rule(:nag => /\$\d+/)
			

