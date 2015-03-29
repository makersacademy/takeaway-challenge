require 'capybara/rspec'
require 'restaurant'
require 'menu'
require 'order'
require 'dish'

feature 'When a new restaurant is created' do
  let(:rest) { Restaurant.new Menu }
  let(:dish) { Dish.new :carbonara, 4.80 }
  let(:time) { (Time.now).strftime('%I:%M %p') }
  let(:delivery) { (Time.now + (60 * 60)).strftime('%I:%M %p') }
  let(:order) { Order.new rest }

  before do
    allow(order).to receive(:print)
    allow($stdout).to receive(:puts)
  end

  scenario 'it has a menu' do
    expect(rest.menu.list).to be_empty
  end

  scenario 'it can add dishes to the menu' do
    rest.menu.add dish
    expect(rest.menu.list).to eq(carbonara: 4.80)
  end

  scenario 'it can remove dishes from the menu' do
    rest.menu.add dish
    rest.menu.remove :carbonara
    expect(rest.menu.list).to be_empty
  end

  scenario 'it can get orders' do
    expect(rest).to receive(:message)
    rest.menu.add dish
    order.add_item :carbonara
    order.close
    order.send :tel
    expect(rest.order_recived).to eq [[order.new_order, time, delivery, :tel]]
  end
end