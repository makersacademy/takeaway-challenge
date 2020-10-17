require 'restaurant'
require 'stringio'

describe Restaurant do

  subject(:restaurant) { Restaurant.new}
  let(:printer_module) {double (:printer_module) }
  let(:order_class) {double (:order_class)}
  let(:food) { double(:food)}
  let(:price) {double(:price)}
  let(:choice) { {food: price} }

  it "contains a list of dishes and prices" do
    expect(restaurant.menu).to eq({
      trout_snout: 6.50,
      hog_soup: 4.90,
      mysterious_dumpling: 8.00,
      boring_sandwich: 4.00,
      cuttlefish_pate: 11.00,
      hoof_broth: 3.30
    })
  end

  describe "#print_menu" do
    it "passes the menu to printer" do
      expect(printer_module).to receive(:menu_printer)
      restaurant.print_menu(printer_module)
    end
  end

  describe "#create_order" do
    it "creates a new instance of the order class when user tries to place an order" do
      expect(order_class).to receive(:new)
      restaurant.create_order(order_class)
    end
  end

  describe "#choose_dish" do
    it "takes user input and passes the choice to the order class the correct number of times" do
      io = StringIO.new
      io.puts"1"
      io.puts"2"
      io.rewind
      $stdin = io
      allow(Order).to receive(:new).and_return(order_class)
      restaurant.create_order
      expect(order_class).to receive(:add).with([:trout_snout, 6.50]).twice
      restaurant.choose_dish
      restaurant.choose_quantity
      $stdin = STDIN
    end
  end

  describe "#check_bill" do
    it "raises an error if the total of the final bill is wrong" do
      allow(Order).to receive(:new).and_return(order_class)
      restaurant.create_order
      io = StringIO.new
      io.puts"1"
      io.puts"2"
      io.rewind
      $stdin = io
      allow(order_class).to receive(:add).with([:trout_snout, 6.5])
      restaurant.choose_dish
      restaurant.choose_quantity
      allow(order_class).to receive(:total).and_return(11.3)
      expect { restaurant.check_bill}.to raise_error("CALCULATION ERROR")
      $stdin = STDIN
    end
  end

  describe "#print_receipt" do
    it "passes information to the printer so that it can print the receipt" do
      expect(printer_module).to receive(:receipt_printer)
      restaurant.print_receipt(printer_module)
    end
  end

  describe "#delivery_time" do
    it "calculates the delivery time (one hour after order placed)" do
      @then = Time.new(2002, 10, 31, 2, 2, 2)
      allow(Time).to receive(:now).and_return(@then)
      expect(restaurant.time_calculator).to eq(" 3:02")
    end
  end

  describe "#text_confirmation" do
    it "triggers text confirmation by passing info to Send_SMS module" do
      @then = Time.new(2002, 10, 31, 2, 2, 2)
      allow(Time).to receive(:now).and_return(@then)
      fake_confirmer = double("Fake SMS sender")
      expect(fake_confirmer).to receive(:send).with(" 3:02")
      restaurant.text_confirmation(fake_confirmer)
    end
  end
end
