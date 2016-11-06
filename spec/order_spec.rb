require 'order'
require 'dotenv'
Dotenv.load

describe Order do

  subject(:order) {described_class.new('./lib/menu.csv')}

  describe "attributes" do
    it "initializes with an empty basket" do
    expect(order.basket).to eq({})
    end

    it "initializes with an empty basket hash" do
    expect(order.basket).to eq({})
    end
  end

  describe "#add_items" do
    it "raises an error if chosen item is not on menu" do
      expect{order.add_item("peas", 2)}.to raise_error "We're sorry, that isn't on the menu."
    end

    it "pushes the dish and quantity as a hash to an array" do
      order.add_item(:pasta)
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
      expect(order.print_order).to eq "2 x pasta = £20, 1 x salad = £4, 4 x icecream = £16\nTotal: £40"
    end
  end

  describe "#confirm_order" do
    before do
      allow(order).to receive(:send_text)
    end
    it "outputs a string saying a text message will be sent" do
      expect(order).to receive(:send_text).with(ENV['NUMBER_TO'])
      expect(order.confirm_order(ENV['NUMBER_TO'])).to eq "Thank you for placing your order."
    end

  end

end
