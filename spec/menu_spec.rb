require "menu"

describe Menu do
  context "#initialize" do
    it "should have a menu list" do
      expect(subject.dish_list).to be_an(Array)
    end

    it "should have a list of dishes" do
      expect(subject.dish_list).to eq(::DEFAUT_MENU)
    end

    it "should have a basket for selection" do
      expect(subject.basket).to eq(subject.basket)
    end
  end

  context "#view_menu" do
    let(:dish) { double :dish, name: "Nan", price: 11.99 }
    it "should return a nicely formated menu" do
      menu = Menu.new([dish])
      expect { menu.view_menu }.to output("Welcome to MJ Takeaway, have a look at the menu below\n1. Nan for $11.99\nTo add dishes to your basket, please enter the item's number.\n").to_stdout
    end
  end
end
