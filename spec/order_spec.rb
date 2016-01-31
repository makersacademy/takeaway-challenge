require 'order'

describe Order do

subject(:order) {described_class.new}
let(:menu) {double(:menu, :menu_list => {"chicken" => 15.50}) }
let(:takeaway) {double(:takeaway, :order => {"chicken" => 15.50})}

  describe '#take_order' do
    it 'takes an order' do
      test_order = "2 * chicken added to your order"
      expect(order.take_order("chicken", 2, menu)).to eq test_order
    end
  end

  describe '#basket' do
    it 'returns a string to the client showing their order' do
      order.take_order("chicken", 2, menu)
      expect(order.basket).to eq "chicken * 2 for $31.0, "
    end
  end

  #describe '#final_order'

end