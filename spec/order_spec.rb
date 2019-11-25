require "order"

describe Order do

  # let(:menu) { double :menu, check_menu: [["Chicken", 10], ["Steak", 15]], get_price: {"Chicken" => 10}, menu: {"Chicken" => 10} }
  # let(:menu_new) {double :menu_new, new: menu}
  let(:menu) { double("Menu", menu: { "Chicken" => 10, "Steak" => 15 }) }
  let(:order)  { Order.new(menu) }

  # describe "#see_menu" do
  #   it "should return a list of dishes and prices" do
  #     expect(order.see_menu).to eq [["Chicken", 10], ["Steak", 15]]
  #   end
  # end

  describe "#add" do
    
    it "should add a dish to the order" do
      subject.add("Chicken")
      expect(subject.order).to eq ["Chicken"]
    end

    it "confirms how many of each dish I have in my order with a message" do
      subject.add("Steak")
      expect(subject.add("Steak")).to eq "You now have 2 of the Steak meal in your order"
    end

    it "should raise an error if the dish isn't on the menu" do      
      expect{ subject.add("Katsu Curry") }.to raise_error("Item not on menu")
    end

  end

  describe "#check_total" do
    it "should show a total price after adding steak and chicken as 25" do
      allow(menu).to receive(:get_price).with("Chicken") { 10 }
      allow(menu).to receive(:get_price).with("Steak") { 15 }

      order.add("Chicken")
      order.add("Steak")
      
      expect(order.check_total).to eq(25)
    end
  end

end
