require 'restaurant'

describe Restaurant do
  # doubles for Restaurant class. (Possible to add all variables and methods)
  # let(:menu_class) { double("menu", menu_list: menu_list, print_menu: "print menu") }
  let(:menu_class) { double("menu") }
  let(:order_class) { double("order") }
  let(:message_class) { double("message") }

  # initialize subject with doubles
  subject { described_class.new({ menu: menu_class, order: order_class, message: message_class }) }

  describe "#initialize" do

    it "initializes with an instance of menu" do
      expect(subject.instance_variable_get(:@menu)).to eql(menu_class)
    end

    it "initializes with an instance of order" do
      expect(subject.instance_variable_get(:@order)).to eql(order_class)
    end

    it "initializes with an instance of message" do
      expect(subject.instance_variable_get(:@message)).to eql(message_class)
    end
  end

  describe "subject responds to method" do

    it "responds to #see_menu" do
      expect(subject).to respond_to(:see_menu)
    end

    it "responds to #place_order" do
      expect(subject).to respond_to(:place_order)
    end

    it "responds to #checkout" do
      expect(subject).to respond_to(:checkout)
    end
  end

  describe "method functionality" do

    it "#see_menu delegates on Menu.print_menu" do
      allow(menu_class).to receive(:print_menu).and_return("menu")
      expect(menu_class).to receive(:print_menu).once
      subject.see_menu
    end

    it "#place_order delegates on Order.add_dish" do
      allow(order_class).to receive(:add_dish).and_return("Cheese Burger", 1)
      expect(order_class).to receive(:add_dish).once
      subject.place_order("Cheese Burger", 1)
    end

    it "#checkout delegates in Order.finish_order and Message.send_message" do
      allow(order_class).to receive(:finish_order).and_return("Receipt")
      allow(message_class).to receive(:send_message).and_return("Confirmation SMS")
      expect(order_class).to receive(:finish_order).once
      expect(message_class).to receive(:send_message).once
      subject.checkout
    end
  end
end
