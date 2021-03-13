require './lib/restaurant.rb'

describe Order do
	it 'includes a menu of dishes with prices' do
		expect(subject).to respond_to(:menu)
		expect(subject.menu).to be_an(Array)
		expect((subject.menu).all? { |item| item.has_key?(:price)}).to be_truthy
	end

	it 'can be shown to the user as a list' do
		expect(subject.list(subject.menu)).to eq(subject.menu)
	end
end