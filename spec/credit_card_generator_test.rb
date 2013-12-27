require 'spec_helper'

describe CreditCardGenerator do

	# it must accept these card patterns as valid card templates
	['1111-1111-1111-111?',
	 '1111-222?-33?3-4444',
	 '1111-22?2-33??-4444',
	 '?111-?222-3?33-?444'].each do |card_pattern|
		it "must accept #{card_pattern} as valid" do
			expect(CreditCardGenerator.new(card_pattern).valid?).to eq(true)
		end
	end

	# it must NOT accept these card patterns as valid card templates
	['1111-1111-1111-1111',
	 '111?-22?2-33?3-?44?'].each do |card_pattern|
		it "must NOT accept #{card_pattern} as valid" do
			expect(CreditCardGenerator.new(card_pattern).valid?).to eq(false)
		end
	end

	it "with one '?' char must generate 10 credit cards" do
		expect(CreditCardGenerator.new('1111-1111-1111-111?').generate.count).to eq(10)
	end

	it "with two '?' must generate 100 credit cards" do
		expect(CreditCardGenerator.new('1111-1111-1111-11??').generate.count).to eq(100)
	end

	it "with three '?' must generate 1000 credit cards" do
		expect(CreditCardGenerator.new('1111-1111-1111-1???').generate.count).to eq(1000)
	end

	it "with four '?' must generate 10000 credit cards" do
		expect(CreditCardGenerator.new('1111-1111-11?1-1???').generate.count).to eq(10000)
	end

end