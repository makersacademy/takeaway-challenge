require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  context "#initialize" do

    it "creates list of #dishes" do
      expect(menu.dishes).to eq described_class::ITEMS_LIST
    end
  end

  context "#read" do

    it "displays the menu" do
      display = menu.dishes.each{ |item, price| "#{item}: £#{price}, " }
      expect(menu.read).to eq display
    end
  end

end
