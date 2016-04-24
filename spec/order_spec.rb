require 'order'

describe Order do
  subject(:order){ described_class.new }

  describe "#initialize" do 
    it "new order" do
      expect(order).to respond_to :list_of_items
    end
  end

  describe "#add_item" do
    it "raises an error if the item isn't on the menu" do
      expect{order.add_item(:fish, 1)}.to raise_error "item isn't on the menu"
    end

    it "adds an item to basket" do
      order.add_item(:chips, 2)
      expect(order.list_of_items).to eq [[:chips, 2]]
    end

    it "updates total price with the new item" do
      test_order = described_class.new
      test_order.add_item(:chips, 2)
      expect(test_order.total_price). to eq 7
    end
  end

  describe "#submit_order" do
    it "raises an error if the total is incorrect" do
      test_order = described_class.new
      test_order.add_item(:chips, 2)
      expect{order.submit_order(100)}.to raise_error "price does not match"
    end
    it "tells the user their order has been placed" do
      test_order = described_class.new
      test_order.add_item(:chips, 2)
      expect(test_order.submit_order(7)).to include "Message sent."
    end
  end

end