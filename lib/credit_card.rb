class CardInvalidException < Exception
end

class CreditCard

	VALID_CARD_PATTERN = /^\d{16}|\d{4}-\d{4}-\d{4}-\d{4}$/

	def valid?
		match = VALID_CARD_PATTERN.match(@card)
		match.nil? ? false : true
	end

	def luhn?
		raise CardInvalidException unless self.valid?
		checksum = 0
		processed_card = @card.delete("-").split("")
		processed_card.each_with_index{ |elmt, idx| checksum += (idx % 2 == 0 ? elmt.to_i.*(2).to_s.split("").map{ |num| num.to_i }.reduce('+') : elmt.to_i ) unless idx == processed_card.length - 1 }
		processed_card[processed_card.length - 1].to_i == (10 - checksum.to_s[checksum.to_s.length - 1].to_i)
	end

	def initialize(card)
		@card = card
	end

end
