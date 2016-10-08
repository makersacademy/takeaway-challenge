require 'interface.rb'
require 'menu.rb'

describe Interface do
  subject (:interface) { described_class.new }
  let(:menu) { Menu.new }
  let(:pizza) {double :food}

  describe "#show-menu" do
    context "when called" do
      it "should return menu contents"do
      expect(interface.show_menu).to eq menu.menu_list
      end
    end
  end

  describe "#show-order" do
    context "when called" do
      it "should show what has been ordered thus far" do
        expect(interface.show_order).to eq interface.order
      end
    end
  end

  describe "#add-to-order"do
    context "when called"do
      it "should add something to the order object" do
        expect{interface.add_to_order(pizza)}.to change{interface.order.length}.by(1)
      end
    end
  end
end
