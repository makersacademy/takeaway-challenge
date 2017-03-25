require 'takeaway.rb'

describe Takeaway do
  subject(:takeaway) { described_class.new}

  describe "#initialize" do
  it "so that I can see a list of dishes with prices, initialize takeaway with menu" do
    menu_items = {"Pizza"=>8.00, "Nachos"=>6.00, "Beer"=>3.00}
    expect(takeaway.menu).to eq menu_items
    end
  end

  describe "#read_menu" do
    it "so that I can see a list of dishes with prices, check takeaway read_menu displays menu items and prices" do
      menu_items = {"Pizza"=>8.00, "Nachos"=>6.00, "Beer"=>3.00}
      expect(takeaway.read_menu).to eq menu_items
    end
  end
end
