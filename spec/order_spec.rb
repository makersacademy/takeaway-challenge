require 'order'
require 'mock_text_message'

describe Order do
  subject(:order) { described_class.new(text_module) }
  let(:text_module) { object_double('mock_text_message') }
  let(:dish) { 'margherita'}
  let(:price) { 5 }
  let(:quantity) { 2 }
  let(:add_to_basket) { order.add_to_basket(dish, quantity, price) }
  let(:pretty_order) { "Margherita (2)\nTotal: £10.00\n" }

  describe '#add_to_basket' do
    it 'adds the item to the basket' do
      expect{ add_to_basket }.to change{ order.items.length }.by(1)
    end
    it 'increases total cost by price of the item multiplied by quantity' do
      expect{ add_to_basket }.to change{ order.total_cost }.by(price * quantity)
    end
  end

  describe '#view_order' do
    before { add_to_basket }
    it 'prints the order in progress' do
      expect{ order.view_order }.to output(pretty_order).to_stdout
    end
  end

  describe '#send_confirmation' do
    it 'instructs Twilio to send a confirmation text' do
      expect(text_module).to receive(:send)
      order.send_confirmation
    end
  end
end
