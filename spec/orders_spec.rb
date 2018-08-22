require 'orders'
require './spec/support/shared_examples_for_dishes.rb'

describe Orders do

  let(:bill) { 
    double :bill, 
    :create => "DISH || QUANTITY || PRICE\nDonner Kebab || 2 || 8\nTOTAL = £16\n"
  }
  let(:sms) { double :sms, :send_sms => "Confirmation SMS sent." }
  let(:order) { Orders.new(bill, sms) }
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

    it_behaves_like Dishes
  end

  describe ".choose_dish" do
    it "will raise an error if dish argument not recognised" do
      expect { order.choose_dish("Pizza", 2) }.to raise_error("Dish not recognised: choose another")
    end

    it "will input dish and quantity to #current hash" do
      order.choose_dish(dish, qty)
      expect(order.current).to eq([[dish, qty, mockMenu.MENU[dish]]])
    end
  end

  describe ".view_order" do 
    it "tells the bill to print" do 
      expect(bill).to receive(:create)
      order.view_order
    end
  end

  describe ".buy" do 
    it "will confirm delivery of order" do
      allow(order).to receive(:buy).and_return("Confirmation SMS sent.")
      order.buy
    end
  end 

end
