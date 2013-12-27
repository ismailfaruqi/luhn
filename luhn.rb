base_dir = File.expand_path(File.join(File.dirname(__FILE__)))
Dir[File.join(base_dir, "lib/**/*.rb")].each { |f| require f }

print 'Jumlah Kartu > '
card_numbers = gets.chomp.to_i
card_patterns = []
for i in 1..card_numbers
	print "Kartu #{i} > "
	card_patterns << gets.chomp
end

card_patterns.each_with_index do |card_pattern, index|
	result = if /\?+/.match(card_pattern).nil?
		begin
			CreditCard.new(card_pattern).luhn? ? 1 : 0
		rescue Exception => e
			0
		end
	else
		begin
			CreditCardGenerator.new(card_pattern).generate.inject(0){ |result, card| result += (card.luhn? ? 1 : 0) }
		rescue Exception => e
			0
		end
	end
	puts "Output kartu #{index + 1}> #{result}"
end
