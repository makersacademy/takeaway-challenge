require 'takeaway'
require 'menu'

describe Takeaway do

  let(:menu) { double :menu }
  subject(:takeaway) { described_class.new(menu) }
  describe '#view_menu' do
    it 'delegates to prices method' do
      allow(menu).to receive(:prices).and_return("spaghetti bolognese: £4.50
        ham and cheese pancake: £3.70
        double-cheeseburger: £4.40
        curly fries: £1.50")
      expect(takeaway.view_menu).to eq("spaghetti bolognese: £4.50
        ham and cheese pancake: £3.70
        double-cheeseburger: £4.40
        curly fries: £1.50")
    end
  end

  describe '#add_dish' do
    it "can add menu dishes to the order" do
      takeaway.add_dish("curly fries", 4)
      expect(takeaway.basket).to eq("You added 4x curly fries(s) to the basket")
    end
  end

  describe '#total_price' do
    let(:takeaway) { Takeaway.new }
    it "calculates total order" do
      takeaway.add_dish("curly fries", 5)
      takeaway.add_dish("curly fries", 6)
      expect(takeaway.total_price).to eq "The total price for your order is £16.5"
    end
  end
end
