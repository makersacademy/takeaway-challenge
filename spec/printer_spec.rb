require 'printer'

describe Printer do

  let(:restaurant) { double(:restaurant, menu: {plastic_pizza: 1.20, plastic_sausage: 2.90})}
  let(:order) { double(:order, selection: [[:plastic_pizza, 1.20], [:plastic_sausage, 2.90]], total: 4.1) }

  describe "#menu_printer" do
    it "prints the dishes and prices out as a list" do
      expect{subject.menu_printer(restaurant.menu)}.to output("1. plastic_pizza: £1.20\n2. plastic_sausage: £2.90\n").to_stdout
    end
  end

  describe "#receipt_printer" do
    it "prints the user's order with the total at the bottom" do
      expect{subject.receipt_printer(order)}.to output("plastic_pizza: £1.20\nplastic_sausage: £2.90\nTotal: £4.10\n").to_stdout
    end
  end

end
