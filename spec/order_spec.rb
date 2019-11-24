require "order"

describe Order do

  let(:menu) { double :menu, check_menu: [["Chicken", 10], ["Steak", 15]] }
  let(:menu_chicken) { double :menu, get_price: 10 }
  let(:menu_steak) { double :menu, get_price: 15 }
  
  describe "#see_menu" do
    it "should return a list of dishes and prices" do
      menu_class_double = double :menu_class, new: menu
      order = Order.new(menu_class_double)
      expect(order.see_menu).to eq [["Chicken", 10], ["Steak", 15]]
    end
  end

  describe "#add" do
    
    it "should add a dish to the order" do
      subject.add("Chicken")
      expect(subject.order).to eq ["Chicken"]
    end

    it "confirms how many of each dish I have in my order with a message" do
      subject.add("Steak")
      expect(subject.add("Steak")).to eq "You now have 2 of the Steak meal in your order"
    end

  end

  describe "#check_total" do
    it "should show a list of dishes on my order with prices and a total at the end" do
      subject.see_menu
      subject.add("Steak")
      subject.add("Chicken")
      expect { subject.check_total }.to output("Steak - £15\nChicken - £10\n---------------\nTotal - £25\n").to_stdout
    end
  end

end
