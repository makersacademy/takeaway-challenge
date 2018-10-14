require 'menu'

describe Menu do
  context "food and drinks!" do
    let(:burger) { double(:Item, name: "Burger", price: 6) }
    let(:coke) { double(:Item, name: "Coke", price: 2) }
    let(:menu) { Menu.new(burger, coke) }
    it "has some foods" do
      expect(menu.items).to include burger
    end
    it "has some drinks" do
      expect(menu.items).to include coke
    end
    it 'should puts the menu with price' do
      menu = Menu.new(burger)
      expect(STDOUT).to receive(:puts).with('Burger - £6')
      menu.view
    end
  end
end
