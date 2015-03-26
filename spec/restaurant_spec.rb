require 'restaurant'
require_relative 'spec_helper'

describe Restaurant do

  let(:restaurant) {Restaurant.new}
  let(:customer) {double :customer, :phone_number => "07545215358"}
  let(:order) {double :order, total_price: 10}

  it "can receive an order" do
      restaurant.take_order(order, 10, customer)
    end

  it "won't accept the order if payment doesn't equal the total price" do
    expect{restaurant.take_order(order, 8)}.to raise_error
  end

  it "tells the customer that their order will be delivered in one hour from now" do
    one_hour_from_now = Time.now + (60 * 60)
    expect(restaurant.delivery_time).to eq(one_hour_from_now.round(0))
  end

end