require 'restaurant'

describe Restaurant do
  
  subject(:cafe)       { described_class.new(menu, order) }
  let(:menu)           { double :menu, new: menu_instance}
  let(:menu_instance)  { double :menu_instance}
  let(:order)          { double :order, new: order_instance }
  let(:order_instance) { double :order_instance}
  let(:item)           { double :item}
  
  it 'shows the restaurant menus' do
    expect(menu_instance).to receive(:print_menus).and_return("starter_menu_main_menu")
    expect(cafe.show_menu).to eq("starter_menu_main_menu")
  end

  describe "#select" do

    it 'allows the user to select items' do
      allow(menu_instance).to receive(:available?).and_return(true)
      allow(order_instance).to receive(:add_to_basket)
      expect { cafe.select(item) }.not_to raise_error
    end

    it "adds available items to the basket" do
      expect(menu_instance).to receive(:available?).and_return(true)
      expect(order_instance).to receive(:add_to_basket)
      expect(order_instance).to receive(:basket).and_return([item])
      cafe.select(item)
      expect(cafe.show_basket).to eq([item])
    end
  end

  describe "#delete" do
    it 'removes items from the basket' do
      expect(menu_instance).to receive(:available?).and_return(true)
      expect(order_instance).to receive(:add_to_basket)
      expect(order_instance).to receive(:remove_from_basket)
      expect(order_instance).to receive(:basket).and_return([])
      cafe.select(item)
      cafe.delete(item)
      expect(cafe.show_basket).to eq([])
    end
  end

  describe "#complete_order" do
    before do
      allow(cafe).to receive(:send_text)
    end

    it 'sends a payment confirmation text message' do
      expect(cafe).to receive(:send_text).with("Thank you for your order: £TBC")
      cafe.complete_order
    end
  end
end