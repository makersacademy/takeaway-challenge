require './lib/menu.rb'

describe Menu do
	it 'includes dishes with prices' do
		expect(subject.dishes).to be_an(Array)
		expect((subject.dishes).all? { |item| item.has_key?(:price)}).to be_truthy
	end

	it 'can be shown to the user' do
		expect(subject.list(subject.dishes)).to eq(subject.dishes)
	end
end