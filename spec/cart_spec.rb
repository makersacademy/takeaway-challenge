require 'cart'

describe Cart do

  let(:cart)        { Cart.new(menu_class)                 }
  let(:menu_class)  { double :menu_class, new: menu_object }
  let(:menu_object) { double :menu_instance                }
  let(:full_cart)   { Cart.new                             }
  let(:time)        { (Time.now)                           }

  # Adding some items to a cart double to test 'remove' and 'my_items' functionality, and stubbing for time
  before do
    allow(Time).to receive(:now).and_return(time)
    full_cart.instance_variable_set(:@items, [{:name => "Prime Rib", :price => 9.25 },{:name => "Ceasar Salad", :price => 3.25 },{:name => "Lemonade", :price => 1.50 }])
  end

  describe "#print_full_menu" do
    it { is_expected.to respond_to :print_full_menu }
    it "delegates printing of menu to menu instance" do
      expect(menu_object).to receive(:print_all)
      cart.print_full_menu
    end
  end

  describe "#print_category" do
    it { is_expected.to respond_to(:print_category).with(1).argument }
    it "delegates printing of menu category to menu instance" do
      expect(menu_object).to receive(:print_category)
      cart.print_category("Dinner")
    end
  end

  describe "#add" do
    it { is_expected.to respond_to(:add).with(1).argument }
    context "item passed is a name of a dish" do
      it "adds the item with corresponding name to @items" do
        subject.add("Veggie Omelette")
        expect(subject.items).to include({:name => "Veggie Omelette", :price => 4.5 })
      end
    end
    context "item passed is an array of dish names" do
      it "adds all items in array to @items" do
        subject.add(["Prime Rib", "Ceasar Salad", "Lemonade"])
        expect(subject.items).to eq [{:name => "Prime Rib", :price => 9.25 },{:name => "Ceasar Salad", :price => 3.25 },{:name => "Lemonade", :price => 1.50 }]
      end
    end
    context "item passed is not valid" do
      it "raises an error explaining valid options" do
        expect { subject.add(4) }.to raise_error("Please input either an item name or an array of item names")
      end
    end
  end

  describe "#remove" do
    it { is_expected.to respond_to(:remove).with(1).argument }
    context "item passed is a name of a dish" do
      it "removes the item with corresponding name from @items" do
        full_cart.remove("Ceasar Salad")
        expect(full_cart.items).not_to include({:name => "Ceasar Salad", :price => 3.25 })
      end
    end
    context "item passed is an array of dish names" do
      it "adds all items in array to @items" do
        full_cart.remove(["Prime Rib", "Ceasar Salad", "Lemonade"])
        expect(full_cart.items).to be_empty
      end
    end
    context "item passed is not valid" do
      it "raises an error explaining valid options" do
        expect { full_cart.remove(4) }.to raise_error("Please input either an item name or an array of item names")
      end
    end
  end

  describe "#my_items" do
    it { is_expected.to respond_to :my_items }
    #This test is ugly due to string formatting, like in menu_spec
    it "neatly prints all items from @items" do
      expect { full_cart.my_items }.to output("\n               Your Cart                \n          --------------------          \n               Prime Rib: £9.25\n            Ceasar Salad: £3.25\n                Lemonade: £1.50\n          --------------------          \n             Total Price: £14.00\n\n").to_stdout
    end
  end

  describe "#total" do
    it { is_expected.to respond_to :total }
    it "returns total price of all items in @items" do
      expect(full_cart.total).to eq 14.00
    end
  end

  describe "#my_total" do
    it { is_expected.to respond_to :my_total }
    it "prints total price of all items in @items" do
      expect { full_cart.my_total }.to output("£14.00\n").to_stdout
    end
  end

  describe "#checkout" do
    it { is_expected.to respond_to(:checkout).with(1).argument }
    context "total entered correctly" do
      it "prints confirmation of order" do
        expect { full_cart.checkout(14.00) }.to output("Thank you, your order has been placed! It should arrive before #{(time + (60 * 60)).strftime('%R')}\n").to_stdout
      end
      it "removes all items from cart for next order" do
        full_cart.checkout(14.00)
        expect(full_cart.items).to be_empty
      end
    end
    context "total entered incorrectly" do
      it "raises an error that total stating incorrect" do
        expect { full_cart.checkout(2.50) }.to raise_error("That total was incorrect. Please input the total price of your order to confirm checkout")
      end
    end
  end

end
