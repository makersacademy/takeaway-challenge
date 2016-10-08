require 'dish'

describe Dish do

	subject(:dish) {described_class.new("Pasta", 3)}
	it { is_expected.to respond_to :price}
	it { is_expected.to respond_to :name }


	it 'can show its name' do
		expect(subject.name).to eq "Pasta"
	end

	it 'can show its price' do
		expect(subject.price).to eq 3
	end
end