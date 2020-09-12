require 'restaurant'

describe Restaurant do

  subject(:restaurant) { Restaurant.new(dish_class_double) }
  let(:dish_class_double) { double('dish_class')}

  it 'has a menu' do
    expect(restaurant).to respond_to(:menu)
  end

  it 'has a dish_class' do
    expect(restaurant).to respond_to(:dish_class)
  end
end