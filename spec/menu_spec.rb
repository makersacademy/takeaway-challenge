
require 'menu'

describe Menu do
subject(:menu) { described_class.new('lib/menu.yaml') }

  describe "#view_menu" do
    it "Displays the menu" do
      expect(menu.view_menu).to eq (YAML.load_file('lib/menu.yaml'))
    end
  end

  describe "#choose" do

    it "allows to pick an item number and stipulate its quantity" do
      menu.choose(:"Kielbasa chicken", 2)
      expect(menu.basket).to eq([{:"Kielbasa chicken"=>4}, {:"Kielbasa chicken"=>4}])
    end

    it "Selects a number of items from the menu" do
      menu.choose(:"Kielbasa chicken", 1)
      menu.choose(:"Bacon ipsum", 1)
      expect(menu.basket).to eq([{:"Kielbasa chicken"=>4}, {:"Bacon ipsum"=>3}])
    end

    it "Updates an item's quantity in the basket to the new total, rather than adding them" do
      menu.choose(:"Kielbasa chicken", 1)
      menu.choose(:"Kielbasa chicken", 2)
      expect(menu.basket).to eq([{:"Kielbasa chicken"=>4}, {:"Kielbasa chicken"=>4}])
    end

    it "Removes items from the basket whose quantity is passed in as zero" do
      menu.choose(:"Kielbasa chicken", 1)
      menu.choose(:"Bacon ipsum", 1)
      menu.choose(:"Kielbasa chicken", 0)
      expect(menu.basket).to eq([{:"Bacon ipsum"=>3}])
    end
  end


  describe "#total" do

    it "Totals the price for all the items in your basket" do
      menu.choose(:"Kielbasa Chicken", 1)
      expect(menu.total).to eq 4
    end
  end

  describe "#complete_order" do

    it "Resets the basket after completion" do
      menu.choose(:"Bacon ipsum", 1)
      menu.complete_order
      expect(menu.basket).to be_empty
    end

    it "sends a confirmation text on completion" do
      allow()
    end
  end
end
