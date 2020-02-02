require 'dish'

describe Dish do

  subject = Dish.new(0)

  it 'Dish should have atribute price' do
    expect(subject).to respond_to(:price)
  end

end
