require "takeaway"
require "dish"
require "customer"
require "order"

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


  describe Order do
    let(:dish) { Dish.new("poppadom", 150) }
    let(:takeaway) { Takeaway.new("Chutney in Putney") }
    let(:order) { Order.new }
    before(:each) { order.add_to_order(dish) }
    it "#add_to_order adds the dish to the order array" do
      expect(order.order.include?(dish)).to eq true
    end

    it "#get_price returns the price of the items so far" do
      expect{order.get_price}.to output("£1.50\n").to_stdout
    end
  end


end
