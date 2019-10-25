require 'dish'

describe Dish do
  subject { Dish.new(name, price) }
  let(:name) { 'Crabs' }
  let(:price) { 20 }

  it 'is an instance of Dish' do
    expect(subject).to be_an_instance_of Dish
  end

	it 'has a name' do
	  expect(subject).to respond_to :name
  end

  it 'has a price' do
    expect(subject).to respond_to :price
  end
end