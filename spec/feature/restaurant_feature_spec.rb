require 'capybara/rspec'
require 'restaurant'
require 'menu'
require 'order'
require 'dish'

feature 'When a new restaurant is created' do
  let(:restaurant) { Restaurant.new Menu }
  let(:dish) { Dish.new :carbonara, 4.80 }
  let(:time) { (Time.now).strftime('%I:%M %p') }
  let(:time_delivery) { (Time.now + (60 * 60)).strftime('%I:%M %p') }
  let(:order) { Order.new restaurant }

  before do
    allow(order).to receive(:print)
    allow($stdout).to receive(:puts)
  end

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
    expect(restaurant).to receive(:message)
    restaurant.menu.add dish
    order.add_item :carbonara
    order.close
    order.send :telephone
    expect(restaurant.order_recived).to eq [[order, time, time_delivery]]
  end
end