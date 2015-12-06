
require 'menu'

describe "Menu" do

  describe "#view_menu" do
    it "Displays the menu" do
      menu = Menu.new('lib/menu.yaml')
      expect(menu.view_menu).to eq (YAML.load_file('lib/menu.yaml'))
    end
  end

  describe "#choose" do

    it "allows to pick an item number and stipulate its quantity" do
      menu = Menu.new('lib/menu.yaml')
      menu.choose(:"Kielbasa chicken", 2)
      expect(menu.basket).to eq([{:"Kielbasa chicken"=>4}, {:"Kielbasa chicken"=>4}])
    end

    it "Selects a number of items from the menu" do
      menu = Menu.new('lib/menu.yaml')
      menu.choose(:"Kielbasa chicken", 1)
      menu.choose(:"Bacon ipsum", 1)
      expect(menu.basket).to eq([{:"Kielbasa chicken"=>4}, {:"Bacon ipsum"=>3}])
    end

    it "Updates an item's quantity in the basket to the new total, rather than adding them" do
      menu = Menu.new('lib/menu.yaml')
      menu.choose(:"Kielbasa chicken", 1)
      menu.choose(:"Kielbasa chicken", 2)
      expect(menu.basket).to eq([{:"Kielbasa chicken"=>4}, {:"Kielbasa chicken"=>4}])
    end

    it "Removes items from the basket whose quantity is passed in as zero" do
      menu = Menu.new('lib/menu.yaml')
      menu.choose(:"Kielbasa chicken", 1)
      menu.choose(:"Bacon ipsum", 1)
      menu.choose(:"Kielbasa chicken", 0)
      expect(menu.basket).to eq([{:"Bacon ipsum"=>3}])
    end
  end


  describe "#total" do

    it "Totals the price for all the items in your basket" do
      menu = Menu.new('lib/menu.yaml')
      menu.choose(:"Kielbasa Chicken", 1)
      expect(menu.total).to eq 4
    end

  end

  describe "#complete_order" do

    xit "Resets the basket after completion" do
      menu = Menu.new('lib/menu.yaml')
      menu.choose(:"Bacon ipsum", 1)
      expect(menu.basket).to be_empty
    end

  end

  describe "#order" do
    xit "Displays the order so it can be reviewed" do
      menu = Menu.new('lib/menu.yaml')
      menu.choose(:"Bacon ipsum", 1)
      menu.sum
    end


  end


end
