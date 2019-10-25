require 'dish'

describe Dish do
  subject { Dish.new(name, price) }
  let(:name) { 'Crabs' }
  let(:price) { 20 }

  it 'is an instance of Dish' do
    expect(subject).to be_an_instance_of Dish
  end

	it 'has a name as a String' do
	  expect(subject.name).to be_an_instance_of String
  end

  it 'has a price as a Float' do
    expect(subject.price).to be_an_instance_of Float
  end
end