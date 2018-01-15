require 'order'

describe Order do

  let(:menu) { double :menu, price: 1.00, contains?: true }
  let(:item) { double :item }
  let(:qty) { double :qty }
  subject(:order) { described_class.new(menu) }

  describe "#add" do
    it "returns qty of item added" do
      expect(order.add(item, qty)).to eq qty
    end

    it "stores item in basket" do
      order.add(item, qty)
      expect(order.basket[item]).to eq qty
    end

    context "when item is already in basket" do
      it "adds quantity to existing item" do
        order = described_class.new(menu, {item => 1})
        expect{ order.add(item, 2) }.to change{ order.basket[item] }.by 2
      end
    end

    context "when requested item not on menu" do
      it "raises error" do
        allow(menu).to receive(:contains?).and_return(false)
        expect{ order.add(item, 1) }.to raise_error "This dish isn't on the menu!"
      end
    end
  end

  describe "#to_s" do
    it "returns summary as string" do
      expect(order.to_s).to be_a String
    end
    
    it "should include items in basket" do
      order = described_class.new(menu, {"test_item_name"=> 1})
      expect(order.to_s).to include "test_item_name"
    end
  end

  describe "#total" do
    it "returns total value of basket" do
      order = described_class.new(menu, {item => 3})
      expect(order.total).to eq 3.00
    end
  end


end