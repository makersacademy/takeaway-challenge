require 'dish'

describe Dish do

  subject = Dish.new('test', 0)

  it 'Dish should have atribute price' do
    expect(subject).to respond_to(:price)
  end

  it 'Dish should have atribute name' do
    expect(subject).to respond_to(:name)
  end
  
end
