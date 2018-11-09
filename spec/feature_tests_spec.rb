require "takeaway"
require "dish"
require "customer"

describe "Feature tests" do
  describe Takeaway do
    context "When setting up the takeaway"  do
      let(:takeaway) { Takeaway.new("Chutney in Putney") }
      let(:dish) { Dish.new("poppadom", 150) }
      it "#add_dish adds specified dish to the menu" do
        takeaway.add_dish(dish)
        expect(takeaway.menu.include?(dish)).to eq true
      end

      it "#return_menu prints the menu with an index and price" do
        takeaway.add_dish(dish)
        expect{ takeaway.return_menu }.to output("1: poppadom £1.50\n").to_stdout
      end
    end
  end
end
