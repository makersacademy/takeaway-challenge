require 'restaurant'

describe Restaurant do

  let(:restaurant) { Restaurant.new }
  let(:pizza) { double(:pizza, price: 5) }
  let(:pasta) { double(:pasta, price: 10) }
  let(:order) { double(:order, dishes: [pizza, pasta], total: 15) }
  let(:texter) { double(:texter, send: true) }

  describe '#place' do
    it 'should raise error if incorrect total given' do
      expect { restaurant.place(order, 14) }.to raise_error("Incorrect total.")
    end

    it 'should send a text message' do
      expect(texter).to receive(:send)
      restaurant = Restaurant.new(texter)
      restaurant.place(order, 15)
    end
  end
end
