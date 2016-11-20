require 'order'
require 'menu'
describe Order do
  subject(:order) { described_class.new }
  let(:incorrect_item) {double :incorrect_item}


  context "basket" do
    it 'should initialize with an empty basket hash' do
      expect(order.basket).to be_empty
    end
  end
  context "grand_total" do
    it 'should have an initial grand total of 0' do
      expect(order.grand_total).to eq 0
    end
  end
  context "menu" do
    it 'should be able to access the menu' do
      expect(order.menu).to eq Menu::MENU
    end
  end
  describe "#add to basket" do
    before do
      allow(incorrect_item).to receive(:to_sym)
    end
    it 'should add an item to the basket' do
      order.add_to_basket(:margherita)
      expect(order.basket).to include(:margherita)
    end
    it 'should not allow items to be added that are not on the menu' do
      expect{order.add_to_basket(incorrect_item)}.to raise_error("Item not on the menu")
    end
    it 'should calculate the total price for multiple items' do
      order.add_to_basket(:margherita, 2)
      expect(order.basket[:margherita]).to eq ["Quantity: 2, Total price: 12"]
    end
  end
  describe "#checkout" do
    before do
      order.add_to_basket(:margherita)
    end
    it 'should take a price as an argument' do
      expect(order).to respond_to(:checkout).with(1).argument
    end
    it 'should return true if the price matches the grand total' do
      expect(order.checkout(6)).to be true
    end
    it 'should return false if the price does not match the grand total' do
      expect{order.checkout(10)}.to raise_error("Incorrect total. Please double-check.")
    end
  end
end
