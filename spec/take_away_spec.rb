require 'take_away'

describe TakeAway do

  let(:menu) { double :menu, 'foo' => 1.99 }
  subject(:take_away) { described_class.new }

  describe "#initialize" do
    it "has a menu object" do
      p menu.foo
      expect(take_away.menu).to be_a(Object)
      # p menu
    end
    it "has a hash for basket" do
      expect(take_away.basket).to be_a(Array)
    end
  end

  describe "#read_menu" do
    it "displays contents of menu in a hash" do
      expect(take_away.read_menu).to be_a(Hash)
    end
  end

  describe "#order" do
    it "saves items to an array" do
      take_away.order("Spicy Soup")
      expect(take_away.basket).to include("Spicy Soup" => 1)
    end
    it "puts a string" do
      expect { take_away.order("Spicy Soup") }.to output("1x Spicy Soup(s) added you your basket\n").to_stdout
    end
  end

  describe "#basket_checker" do
    it "checks whether item is in menu" do
      expect{ take_away.order("item that's not in menu") }.to raise_error 'item not in menu'
    end
  end

  describe "#basket_summary" do
    it "puts a basket summary string" do
      take_away.order 'Spicy Soup', 1
      expect { take_away.basket_summary }.to output("1x Spicy Soup(s) added you your basket\n").to_stdout
    end
  end
end
