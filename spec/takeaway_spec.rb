require 'takeaway'
require 'menu'
describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) {double :menu}

  before do
    allow(menu).to receive(:menu).and_return(margherita: 6)
  end

  it 'should initialize with an empty order hash' do
    expect(takeaway.basket).to be_empty
  end

  it 'should access the menu from the Menu class' do
    expect(takeaway.menu).to include(margherita: 6)
  end

  describe "#see_menu" do
    it 'should show the customer the menu' do
      expect{takeaway.see_menu}.to output.to_stdout
    end
  end
  describe "#show_basket" do
    before do
      allow(menu).to receive(:basket).and_return({})
    end
    it 'should show the current basket' do
      expect(takeaway.show_basket).to eq menu.basket
    end
  end
  describe "#add_to_basket" do
    it 'should add an order to the basket' do
      takeaway.add_to_basket("margherita")
      expect(takeaway.basket).to include "margherita"
    end
  end
  describe "#show_price" do
    it 'should show the grand_total' do
      takeaway.add_to_basket("margherita")
      expect(takeaway.show_price).to eq "£6"
    end
  end
  describe "#checkout" do
    it 'should call the order checkout method' do
      takeaway.add_to_basket("margherita")
      expect(takeaway.checkout(6)).to eq true
    end
  end

end
