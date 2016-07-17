require 'order'

describe Order do
  let(:list) { Takeaway::LIST }
  let(:order_quantities) { {mushypeas: 1, kebab: 1, fish: 1, chips: 2} }
  let(:my_total) { 16 }
  let(:my_wrong_total) { 10 }
  let (:order) { described_class.new(list, order_quantities, my_total) }
  let (:order2) { described_class.new(list, order_quantities, my_wrong_total) }

  describe '#total' do
    it "works out the total price of the dishes ordered" do
      expect(order.total).to eq 16
    end
    describe '#match_total?' do
      it "checks if total equals my total" do
        order.total
        expect(order.match_total).to be true
      end
    end
  end
  context "If total is not equal to my total" do
    it 'returns an error' do
      expect{ order2.match_total }.to raise_error("Your sum is not correct!")
    end
  end
end
