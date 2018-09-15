require "printer"

describe Printer do

  describe "#format" do
    it "prints the menu" do
      expect { Printer.new.format([{ Dish: "Duck", Price: "12" }]) }.to output("Duck: £12\n").to_stdout
    end

  end

end
