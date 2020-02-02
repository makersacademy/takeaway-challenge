require 'dish'

describe Dish do

  it 'Dish should have atribute price' do
    expect(subject).to respond_to(:price)
  end

end
