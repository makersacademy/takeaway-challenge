require "printer"

describe Printer do

#  let(:mock_order) { double :mock_order, :total => 0}
let(:total) { double :total}

  describe "#format" do
    it "prints the menu" do
      expect { Printer.new.format([{ Dish: "Duck", Price: "12" }]) }.to output("Duck: £12\n").to_stdout
    end

  describe "#print_bill" do
    it "prints the total bill from an order" do
      printer = Printer.new
      expect { printer.print_bill([{ Dish: "Duck", Price: "12" }], total)}.to output("Duck: £12\nTotal: £#{total}\n").to_stdout
    end
  end

  end

end
