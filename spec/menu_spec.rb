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

  context "#select_dish" do
    it { is_expected.to respond_to(:select_dish).with(1).argument }

    let(:another_dish) { double :dish, name: "plantain", price: 4.99 }
    it "should raise an error if the selected dish is not in the menu" do
      menu = Menu.new([another_dish])
      expect { menu.select_dish(6) }.to raise_error("This dish is not in the menu")
    end

    it "should add the order to the basket of selections" do
      subject.select_dish(2)
      expect(subject.basket).to eq([subject.dish_list[1]])
    end
  end

  context "#view_basket" do
    it "should show the list of item selected and the TOTAL" do
      subject.select_dish(1)
      subject.select_dish(1)
      subject.select_dish(1)
      subject.select_dish(3)
      subject.select_dish(6)
      subject.select_dish(6)
      expect { subject.view_basket }.to output("This your selection of dishes so far:\n3 x jerk_chicken: $35.97\n1 x Burger: $7.99\n2 x pizza: $19.98\nTHE TOTAL IS: $63.94.\n").to_stdout
    end
  end
end
