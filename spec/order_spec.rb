require 'order'
require 'dotenv'
Dotenv.load

describe Order do

  subject(:order) {described_class.new('./lib/menu.csv')}

  describe "initializes with" do
    it "an empty basket" do
      expect(order.basket).to eq({})
    end

    it "a menu" do
      expect(order.menu.dishes).to eq({:pasta=>"10.00", :pizza=>"9.00", :salad=>"4.00", :chips=>"3.00", :icecream=>"4.00"})
    end
  end

  describe "has attributes" do
    it "basket" do
      expect(order).to respond_to(:basket)
    end
    it "menu" do
      expect(order).to respond_to(:menu)
    end
  end

  describe "#add_items" do
    it "raises an error if chosen item is not on menu" do
      expect{order.add_item("peas", 2)}.to raise_error "We're sorry, that isn't on the menu."
    end

    it "pushes the dish and quantity as a hash to an array" do
      order.add_item(:pasta, 1)
      expect(order.basket).to eq(pasta: 1)
    end

    it "pushes the dish and price as a hash to an array multiple times" do
      order.add_item(:icecream, 2)
      expect(order.basket).to eq(icecream: 2)
    end

    it "tells the user the item and quantity which has been added" do
      expect(order.add_item(:pasta, 3)).to eq "3 x pasta added to your basket"
    end
  end

  describe "#print_order" do
    before do
      order.add_item(:pasta, 2)
      order.add_item(:salad, 1)
      order.add_item(:icecream, 4)
    end
    it "prints the contents of the basket" do
      expect(order.print_order).to eq "2 x pasta = £20.00, 1 x salad = £4.00, 4 x icecream = £16.00\nTotal: £40.00"
    end
  end

end
