require 'dish'

describe Dish do
  it 'is an instance of Dish' do
    expect(subject).to be_an_instance_of Dish
  end

	it 'has a name' do
	  expect(subject.name).to be_an_instance_of String
  end

  it 'has a price' do
    expect(subject.name).to be_an_instance_of Float
  end
end