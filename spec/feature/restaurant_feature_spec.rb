require 'capybara/rspec'
require 'restaurant'
require 'menu'
require 'dish'

feature 'When a new restaurant is created' do
  let(:restaurant) { Restaurant.new Menu }
  let(:dish) { Dish.new :carbonara, 4.80 }

  scenario 'it has a menu' do
    expect(restaurant.menu.list).to be_empty
  end

  scenario 'it can add dishes to the menu' do
    restaurant.menu.add dish
    expect(restaurant.menu.list).to eq(carbonara: 4.80)
  end

  scenario 'it can remove dishes from the menu' do
    restaurant.menu.add dish
    restaurant.menu.remove dish
    expect(restaurant.menu.list).to be_empty
  end

  scenario 'it can get orders' do
    expect(restaurant).to receive(:send_message)
    restaurant.get :order, :telephone
    expect(restaurant.order_recived).to eq [:order]
  end
end