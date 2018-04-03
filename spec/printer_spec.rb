require './lib/printer.rb'

describe Printer do

  describe "#print_add(dish,quantity)" do

    it "prints the add method" do
      dish = double(:dish)
      quantity = double(:quantity)
      expect(subject.print_add(dish, quantity)).to eq("(x#{quantity}) #{dish} added to basket.")
    end

  end

end
