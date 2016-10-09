require "interface"

describe Interface do

  let(:menu) {double(:menu)}
  let(:order_class) {double(:order_class, new: order_instance)}
  let(:order_instance) {double(:order, add_to_order: nil, review_order: nil, checkout: nil)}

  let (:options_hash) {{menu: menu, order: order_class}}
  subject(:interface) {described_class.new(options_hash)}

  before do
    allow(STDOUT).to receive (:puts)
  end

  context "Initialize" do
    it "Saves a menu when initialized" do
      expect(interface.instance_variable_get(:@menu)).to eq menu
    end

    it "Saves the order class when initialized" do
      expect(interface.instance_variable_get(:@order_class)).to eq order_class
    end

    it "does not have a current order when initialized" do
      expect(interface.instance_variable_get(:@current_order)).to be_nil
    end
  end

context "moves to the Menu class" do
  it "Tells the Menu to print menu"  do
    expect(menu).to receive (:show_menu)
    interface.show_menu
  end
end

context "Beginning an order" do
  describe "#new_order" do
    before do
      interface.new_order
  end

  it "send the menu to the order instance" do
    expect(order_class).to have_received(:new).with(menu)
  end

  it "Saves the new order" do
    expect(interface.instance_variable_get(:@current_order)).to eq order_instance
  end
end

describe "#order" do
  it "Rasies an error if there is no open order" do
    expect{interface.order("Taco")}.to raise_error "Please begin your order"
  end

  it "delegates ordering one item to the order class" do
    interface.new_order
    interface.order("Taco")
    expect(order_instance).to have_received(:add_to_order).with("Taco", 1)
  end

  it "delegates ordering multiple items to the order class" do
    interface.new_order
    interface.order("Taco", 3)
    expect(order_instance).to have_received(:add_to_order).with("Taco", 3)
  end

  describe "#review_order" do
    before do
      interface.new_order
      interface.order("Taco", 3)
    end

    it "delegates reviewing the order to the order instance" do
      interface.review_order
      expect(order_instance).to have_received(:review_order)
    end

    describe "#checkout" do
      before do
        interface.new_order
        interface.order("Taco", 3)
        interface.checkout(3.00)
      end

      it "delegates completing an order to the order_instance" do
        expect(order_instance).to have_received(:checkout)
      end

      it "places the current_order back to nil" do
        expect(interface.instance_variable_get(:@current_order)).to be_nil
      end
    end
  end
end
end
end
