require 'capybara/rspec'
require 'dish'
require 'menu'
require 'restaurant'
require 'order'

feature 'When a new order is started' do
  let(:dish1) { Dish.new :carbonara, 4.80 }
  let(:dish2) { Dish.new :amatriciana, 4.40 }
  let(:dish3) { Dish.new :pesto, 4.50 }
  let(:restaurant) { Restaurant.new Menu }
  let(:order) { Order.new restaurant }

  before do
    allow(order).to receive(:print)
    allow($stdout).to receive(:puts)
    restaurant.menu.add dish1
    restaurant.menu.add dish2
    restaurant.menu.add dish3
  end

  scenario 'can add dishes to order' do
    order.add_item :carbonara
    expect(order.new_order).to eq(carbonara: [1, 4.80])
  end

  scenario 'can add multiple dishes to order' do
    order.add_item :carbonara, 5
    expect(order.new_order).to eq(carbonara: [5, 24.00])
  end

  scenario 'can remove dishes from the order' do
    order.add_item :carbonara
    order.remove_item :carbonara
    expect(order.new_order).to be_empty
  end

  scenario 'can remove multiple dishes from the order' do
    order.add_item :carbonara, 5
    order.remove_item :carbonara, 3
    expect(order.new_order).to eq(carbonara: [2, 9.60])
  end

  scenario 'can check the order so far' do
    order.add_item :carbonara
    order.add_item :amatriciana
    expect(order.check).to eq(order.new_order)
  end

  scenario 'can check the total so far' do
    order.add_item :carbonara
    order.add_item :pesto
    expect(order.total).to eq 9.30
  end

  scenario 'can be closed' do
    order.add_item :carbonara
    order.close
    expect { order.add_item :pesto }.to raise_error
  end

  scenario 'can be sent' do
    order.add_item :carbonara
    order.close
    expect(restaurant).to receive(:send_message)
    order.send :telephone
    expect(restaurant.order_recived).to eq [order]
  end
end
