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
    expect(restaurant.menu[:trout_snout]).to eq(6.50)
    expect(restaurant.menu[:mysterious_dumpling]).to eq(8.00)
    expect(restaurant.menu[:hoof_broth]).to eq(3.30)
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
    before do
      io = StringIO.new
      io.puts"1"
      io.puts"2"
      io.rewind
      $stdin = io
    end
    after do
      $stdin = STDIN
    end
    it "takes user input and passes the choice to the order class the correct number of times" do
      allow(Order).to receive(:new).and_return(order_class)
      restaurant.create_order
      expect(order_class).to receive(:add).with([:trout_snout, 6.50]).twice
      restaurant.choose_dish
    end
  end

  describe "#check_bill" do
    it "raises an error if the total of the final bill is wrong" do
      expect { restaurant.check_bill(order.total)}.to raise_error
    end
  end
end
