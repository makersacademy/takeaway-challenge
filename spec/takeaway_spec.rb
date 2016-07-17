require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new }
  let(:list) { Takeaway::LIST }
  let(:order_quantities) { {mushypeas: 1, kebab: 1, fish: 1, chips: 2} }
  let(:my_total) { 16 }
  describe '#show_menu' do
    it 'provides a list of dishes with prices' do
      expect(takeaway.show_menu).to eq list
    end
  end
  context 'When order is placed' do
    before do
      takeaway.take_order(order_quantities, my_total)
    end
    describe '#take_order' do
      it "records the list of ordered dishes with their quantities" do
        expect(takeaway.order_quantities).to eq order_quantities
      end
      it "records my total" do
        expect(takeaway.my_total).to eq 16
      end
    end
  end
end
