
require_relative "../lib/printer"

describe Printer do

  subject(:printer) { described_class.new }

  describe "#print_" do
    let(:dish) { :Pizza }
    let(:price) { 10.0 }
    let(:i) { 0 }
    it "will print a menu item and its price to stdout" do
      expect { printer.print_(dish, i, price) }.to output("1. Pizza -- £10.0\n").to_stdout
    end
  end

  describe "#print_all" do
    let(:dishes) { { Pizza: 10.0, Pasta: 5.0 } }
    it "will print all menu item and there prices to stdout" do
      expect { printer.print_all(dishes) }.to output("1. Pizza -- £10.0\n2. Pasta -- £5.0\n").to_stdout
    end
  end

  describe "#print_an_order_of" do
    let(:food) { :Pizza }
    let(:quant) { 4 }
    it "will print an order and its quantity to stdout" do
      expect { printer.print_an_order_of(food, quant) }.to output("Dish: Pizza X4.\n").to_stdout
    end
  end

  describe "#print_all_orders_in" do
    let(:basket) { { Pizza: 1 } }
    it "prints all orders in basket to stdout" do
      expect { printer.print_all_orders_in(basket) }.to output("Dish: Pizza X1.\n").to_stdout
    end
  end

  describe "print_the" do
    let(:total) { 10.0 }
    it "will print the total to stdout" do
      expect { printer.print_the(total) }.to output("Total cost: 10.0\n").to_stdout
    end
  end

end
