require 'order'

describe Order do

  subject(:order) {described_class.new}
  let(:menu) {double(:menu, :menu_list => {"chicken" => 15}) }
  let(:takeaway) {double(:takeaway, :order => {"chicken" => 15})}

  describe '#take_order' do
    it 'takes an order' do
      test_order = "2 * chicken added to your order"
      expect(order.take_order("chicken", 2, menu)).to eq test_order
    end
  end

  describe '#basket' do
    it 'returns a string to the client showing their order' do
      order.take_order("chicken", 2, menu)
      test_order = "Your order summary is: \nchicken * 2 for $30,\nTotal = 30"
      expect(order.basket).to eq test_order
    end
  end
end