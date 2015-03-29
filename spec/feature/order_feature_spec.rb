require 'capybara/rspec'
require 'dish'
require 'menu'
require 'restaurant'
require 'order'

feature 'When a new order is started' do
  let(:dish1) { Dish.new :carbonara, 4.80 }
  let(:dish2) { Dish.new :amatriciana, 4.40 }
  let(:dish3) { Dish.new :pesto, 4.50 }
  let(:rest) { Restaurant.new Menu }
  let(:time) { (Time.now).strftime('%I:%M %p') }
  let(:delivery) { (Time.now + (60 * 60)).strftime('%I:%M %p') }
  let(:order) { Order.new rest }

  before do
    allow(order).to receive(:print)
    allow($stdout).to receive(:puts)
    rest.menu.add dish1
    rest.menu.add dish2
    rest.menu.add dish3
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
    expect(rest).to receive(:message)
    order.send :tel
    expect(rest.order_recived).to eq [[order.new_order, time, delivery, :tel]]
  end
end
