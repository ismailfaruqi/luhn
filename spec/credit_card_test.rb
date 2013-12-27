require 'spec_helper'

describe CreditCard do
	
	# valid cards example
	['1111-1111-1111-1111',
	 '1111111111111111'].each do |card|
	 	it "must pass #{card} as valid" do
	 		expect(CreditCard.new(card).valid?).to eq(true)
	 	end
	end

	# invalid cards example
	['1111-1111-1111-11111',
	 '1111-1-11-1111-11111',
	 '11111'].each do |card|
	 	it "must NOT pass #{card} as valid" do
	 		expect(CreditCard.new(card).valid?).to eq(false)
	 	end
	end	

	['4111-1111-1111-1111',
	 '4111-1111-1111-1152'].each do |card|
	 	it "must pass #{card} as Luhn" do
			expect(CreditCard.new(card).luhn?).to eq(true)
		end
	end
	

	it "must NOT pass these cards as Luhn" do
		expect(CreditCard.new('1111-1111-1111-1111').luhn?).to eq(false)
	end
	
end