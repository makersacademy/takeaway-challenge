require 'order'

describe Order do
  subject(:order){described_class.new}

  describe '#view_menu' do
    it "prints out the menu" do
      expect(order.view_menu).not_to be_empty
    end
  end

  describe '#view_order' do
    it "prints out the customer's order" do
      expect(order.view_order).to be_empty
    end
  end

  describe '#add_dish' do
    it "adds a choosen item to the customer's order" do
      order.add_dish("cod")
      expect(order.view_order).to eq ["cod"]
    end
  end


end
