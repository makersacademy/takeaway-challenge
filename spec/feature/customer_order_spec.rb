require 'capybara/rspec'
require 'restaurant'
require 'customer'
require 'dish'

feature 'customer can place an order' do

  let(:customer) { Customer.new(name: "Dan", phone: ENV['MOBILE_NUM']) }
  let(:big_mac) { Dish.new(name: "Big Mac", price: 3.99) }
  let(:fries) { Dish.new(name: "Salty French Fries", price: 1.99) }
  let(:cola) { Dish.new(name: "Gallon o' Coke", price: 1.99) }
  let(:cafe) { Restaurant.new(big_mac, fries, cola) }

  scenario 'Customer can send order & total, will error if incorrect' do
    allow(cafe).to receive(:send_sms) { 'success' }
    order = { restaurant: cafe, items: [[1, 1], [2, 1], [3, 1]], total: 7.96 }
    expect { customer.order(order) }.to raise_error "wrong total"
  end

  scenario 'Customer can send order & receive sms confirmation' do
    order = { restaurant: cafe, items: [[1, 1], [2, 1], [3, 1]], total: 7.97 }
    required_sms_hsh = { from: customer }
    expect(cafe).to receive(:send_sms).with(hash_including(required_sms_hsh)) do
      'success'
    end
    customer.order(order)
  end
end