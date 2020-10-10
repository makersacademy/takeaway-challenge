require 'printer'

describe Printer do

  let(:restaurant) { double(:restaurant, menu: {plastic_pizza: 1.20, plastic_sausage: 2.90})}

  describe "printing the menu for customers to see" do
    it "prints the menu" do
      expect{subject.print(restaurant)}.to output("plastic_pizza: £1.20\nplastic_sausage: £2.90\n").to_stdout
    end
  end
end
