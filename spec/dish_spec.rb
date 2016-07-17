require 'dish'

describe Dish do
	let(:name) { double :name }
	let(:price) { double :price }
	subject { described_class.new(data: {name: name, price: price}) }
	it "should know its name" do
		expect(subject.name).to eq name
	end

	it "should know its price" do
		expect(subject.price ).to eq price
	end

end