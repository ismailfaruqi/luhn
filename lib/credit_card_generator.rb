require 'pry'

class CardTemplateInvalidException < Exception
end

class CreditCardGenerator

	CARD_PATTERN = /^[\d\?]{4}-[\d\?]{4}-[\d\?]{4}-[\d\?]{4}$/

	def initialize(card_pattern)
		@card_pattern = card_pattern
	end

	def valid?
		!CARD_PATTERN.match(@card_pattern).nil? &&
			self.get_question_mark_length >= 1 &&
			self.get_question_mark_length <= 4
	end

	def get_question_mark_positions
		positions = []
		@card_pattern.split("").each_with_index{ |elmt, index| positions << index if elmt == '?'}
		positions
	end

	def get_question_mark_length 
		self.get_question_mark_positions.length
	end

	def generate
		raise CardTemplateInvalidException unless self.valid? 
		base_digits = [[0], [1], [2], [3], [4], [5], [6], [7], [8], [9]]
		digit_cartesian_product = base_digits
		for i in 2 .. self.get_question_mark_length do
			digit_cartesian_product = digit_cartesian_product.product(base_digits)
			digit_cartesian_product.map!{ |elmt| elmt.flatten }
		end		
		cards = []
		digit_cartesian_product.each do |digits|
			card_string = @card_pattern.dup
			self.get_question_mark_positions.each do |position|
				card_string[position] = digits.pop.to_s
			end
			cards << CreditCard.new(card_string)
		end
		cards
	end
end