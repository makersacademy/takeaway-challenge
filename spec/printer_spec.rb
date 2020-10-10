require 'printer'

describe Printer do

  let(:restaurant) { double(:restaurant, menu: {plastic_pizza: 1.20, plastic_sausage: 2.90})}

  describe "printing the menu for customers to see" do
    it "prints the dishes and prices out as a list" do
      expect{subject.menu_printer(restaurant.menu)}.to output("1. plastic_pizza: £1.20\n2. plastic_sausage: £2.90\n").to_stdout
    end
  end
end
