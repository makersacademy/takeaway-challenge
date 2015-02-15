require 'restaurant'
require_relative 'spec_helper'

describe Restaurant do

  let(:restaurant) {Restaurant.new}
  let(:customer) {double :customer, :phone_number => "07545215358"}

  it "can receive an order" do
    order = double :order, total_price: 10
    VCR.use_cassette("sending_text") do
      restaurant.take_order(order, 10, customer)
    end
  end

  it "won't accept the order if full payment is not received" do
    order = double :order, total_price: 10
    expect{restaurant.take_order(order, 8)}.to raise_error
  end

  it "won't accept the order if too much payment is received" do
    order = double :order, total_price: 10
    expect{restaurant.take_order(order, 12, test_number)}.to raise_error
  end

  it "tells the customer that their order will be delivered in one hour from now" do
    one_hour_from_now = Time.now + (60 * 60)
    expect(restaurant.delivery_time).to eq(one_hour_from_now.round(0))
  end

end