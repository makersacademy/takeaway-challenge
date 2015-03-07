require 'dish'

describe Dish do
let(:dish){Dish.new("Fish&Chips", 3)}

  it 'has a name and a price when created' do
    expect(dish).to respond_to(:name, :price)
  end
  
end