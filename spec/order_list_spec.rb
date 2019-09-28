require 'order_list'

describe OrderList do
  describe "#initialize" do
    it "initializes with an empty list to store user order" do
      expect(subject.order_list).to be_empty
    end
  end

  describe "#add_to_order" do
    let(:item) { double :item }
    let(:quantity) { double :quantity }
    it "adds selected item and quantity to order_list" do
      subject.add_to_order(item, quantity)
      expect(subject.order_list).to include({ item => quantity })
    end


  end
end
