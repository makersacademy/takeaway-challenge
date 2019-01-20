require 'Restaurant'

RSpec.describe Restaurant do
  let(:restaurant) { described_class.new }

  context "Bill and confirmation" do
    it 'total bill matches the sum of the various dishes in my order' do
      3.times { restaurant.menu.select_dish('burger', 1) }
      expect(restaurant.bill).to eq(15)
    end

    it 'will raise an error if meal is not selected' do
      expect { restaurant.place_your_order }.to raise_error('Please select your meal')
    end

    it 'places an order and message is being sent to customer' do
      allow(restaurant).to receive(:require_relative)
      restaurant.menu.select_dish('burger', 1)
      restaurant.bill
      restaurant.place_your_order
      expect(restaurant.kitchen).to eq(restaurant.menu.your_order)
    end
  end

end
