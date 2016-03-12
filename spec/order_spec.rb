require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:valid_dish) { {name: 'sushi', amount: 3, price: 7} }
  let(:invalid_dish) { {name: 'sandwitch', amount: 1} }
  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages, create: nil)}


  describe '#show_menu' do
    it '0.0 shows a list of dishes available to order with price' do
      expect(order.show_menu).to include('sushi: £7' && 'ramen: £12')
    end
  end

  describe '#price' do
    it '1.0 finds a price of each dish' do
      expect(order.price(valid_dish)).to eq(valid_dish[:price])
    end
    it '1.1 raises an error if the dish is not included in the menu' do
      message = 'Choose dishes in the menu'
      expect{order.price(invalid_dish)}.to raise_error message
    end
  end

  # describe '#confirm' do
  #   it '2.0 calls messages method on client' do
  #     expect(client.messages).to receive(:create)
  #     order.confirm
  #   end
  # end
end
