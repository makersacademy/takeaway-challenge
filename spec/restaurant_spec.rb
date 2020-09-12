require 'restaurant'

describe Restaurant do

  subject(:restaurant) { Restaurant.new(dish_class_double) }
  let(:dish_class_double) { double('dish_class', new: dish_double) }
  let(:dish_double) {double('dish_double') }

  it 'has a menu' do
    expect(restaurant).to respond_to(:menu)
  end

  it 'sets the dish_class' do
    expect(restaurant).to have_attributes(:dish_class => dish_class_double)
  end

  it 'creates new dishes of class dish_class from the saved menu' do
    expect(dish_class_double).to receive(:new).exactly(Restaurant::SAVED_MENU.count).times
    restaurant
  end

  it 'adds the new dishes to the menu' do
    restaurant
    expect(restaurant.menu.count).to eq(Restaurant::SAVED_MENU.count)
  end
end