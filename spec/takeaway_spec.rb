require "takeaway"

describe Takeaway do
  context "#initialize" do
    it "should have a menu" do
      expect(subject.menu).to be_a(Menu)
    end

    it "should have a cart for selection" do
      expect(subject.cart).to eq(subject.cart)
    end
  end

  context "#select_dish" do
    it { is_expected.to respond_to(:select_dish).with(1).argument }

    let(:another_dish) { double :dish, name: "plantain", price: 4.99 }

    it "should raise an error if the selected dish is not in the menu" do
      order = Takeaway.new(Menu.new([another_dish]))
      expect { order.select_dish(6) }.to raise_error("This dish is not in the menu")
    end

    let(:menu) { double :menu }
    it "should add the order to the basket of selections" do
      subject.select_dish(2)
      expect(subject.cart).to eq([subject.menu.dish_list[1]])
    end
  end

  context "#view_cart" do
    it "should show the list of item selected and the TOTAL" do
      subject.select_dish(1)
      subject.select_dish(1)
      subject.select_dish(1)
      subject.select_dish(3)
      subject.select_dish(6)
      subject.select_dish(6)
      expect { subject.view_cart }.to output("This your selection of dishes so far:\n3 x jerk_chicken: $35.97\n1 x Burger: $7.99\n2 x pizza: $19.98\nTHE TOTAL IS: $63.94\n").to_stdout
    end
  end
end
