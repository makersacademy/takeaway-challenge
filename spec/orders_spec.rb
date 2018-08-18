require 'orders'

describe Orders do

  let(:order) { Orders.new }
  let(:dish)  { "Donner Kebab" }
  let(:qty)   { 2 }
  

  describe "#current" do
    it "creates an empty hash upon initialization" do
      expect(order.current).to eq({})
    end
  end

  describe ".view_menu" do
    it "shows menu with prices" do
      expect { order.view_menu }.to output("Burger & Chips - £7\nDonner Kebab - £8\nMystery Curry - £9\nHoisin Duck Pankcakes - £10\n").to_stdout
    end
  end

  describe ".choose_dish" do
    it { is_expected.to respond_to(:choose_dish).with(2).argument }

    it "will input dish and quantity to #current hash" do
      order.choose_dish(dish, qty)
      expect(order.current).to eq({ dish => qty })
    end

  end

end
