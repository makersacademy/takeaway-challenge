require 'dish'

describe Dish do
  
  let(:dish) { Dish.new('name', 'price') }

  it 'has name and price' do
    expect(dish).to have_attributes(name: 'name', price: 'price')
  end

end