require 'orders'

describe Orders do

  let(:order) { Orders.new }
  let(:dish)  { "Donner Kebab" }
  let(:qty)   { 2 }
  let(:mockMenu) { double :mockMenu, :MENU => { dish => 8 } }
  

  describe "#current" do
    it "creates an array with titles upon initialization" do
      expect(order.current).to eq([])
    end
  end

  describe ".view_menu" do
    it "shows menu with prices" do
      expect { order.view_menu }.to output("Burger & Chips - £7\nDonner Kebab - £8\nMystery Curry - £9\nHoisin Duck Pancakes - £10\n").to_stdout
    end
  end

  describe ".choose_dish" do
    it { is_expected.to respond_to(:choose_dish).with(2).argument }

    it "will input dish and quantity to #current hash" do
      order.choose_dish(dish, qty)
      expect(order.current).to eq([[dish, qty, mockMenu.MENU[dish]]])
    end
  end

  describe ".view_order" do 
    it "will display current order along with total" do 
      order.choose_dish(dish, qty)
      expect { order.view_order }.to output("DISH || QUANTITY || PRICE\nDonner Kebab || 2 || 8\nTOTAL = £16\n").to_stdout
    end
  end

  describe ".buy" do 
    it "will confirm delivery of order" do
      allow(order).to receive(:buy).and_return("Confirmation SMS sent.")
    end
  end 

end
