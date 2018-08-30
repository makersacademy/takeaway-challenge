require 'cart'

describe Cart do

  let(:cart)        { Cart.new(menu_class)                 }
  let(:menu_class)  { double :menu_class, new: menu_object }
  let(:menu_object) { double :menu_instance                }
  let(:full_cart)   { Cart.new                             }
  let(:time)        { Time.now                             }
  let(:fake_sms)    { double :text_sender_instance         }

  # Adding some items to a cart double to test 'remove' and 'my_items' functionality, and stubbing for time
  before do
    allow(Time).to receive(:now).and_return(time)
    full_cart.instance_variable_set(:@items, [{ :name => "Prime Rib", :price => 9.25, :quantity => 1 }, { :name => "Ceasar Salad", :price => 3.25, :quantity => 2 }, { :name => "Lemonade", :price => 1.50, :quantity => 1 }])
    full_cart.instance_variable_set(:@sms, fake_sms)
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
        expect(subject.items).to include({ :name => "Veggie Omelette", :price => 4.5, :quantity => 1 })
      end
      it "updates quantity if one already in cart" do
        full_cart.add("Prime Rib")
        expect(full_cart.items[0]).to eq ({ :name => "CHANGED FROM PRIME RIB", :price => 9.25, :quantity => 2 })
      end
    end
    context "item passed is an array of dish names" do
      it "adds all items in array to @items" do
        subject.add(["Prime Rib", "Ceasar Salad", "Lemonade"])
        expect(subject.items).to eq [{ :name => "Prime Rib", :price => 9.25, :quantity => 1 }, { :name => "Ceasar Salad", :price => 3.25, :quantity => 1 }, { :name => "Lemonade", :price => 1.50, :quantity => 1 }]
      end
      it "updates quantities if item already in cart" do
        full_cart.add(["Prime Rib", "Coffee"])
        expect(full_cart.items).to eq [{ :name => "Prime Rib", :price => 9.25, :quantity => 2 }, { :name => "Ceasar Salad", :price => 3.25, :quantity => 2 }, { :name => "Lemonade", :price => 1.50, :quantity => 1 }, { :name => "Coffee", :price => 1.00, :quantity => 1 }]
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
        full_cart.remove("Prime Rib")
        expect(full_cart.items).not_to include({ :name => "Prime Rib", :price => 9.25, :quantity => 1 })
      end
      it "updates quantity instead of removing if quantity of item > 1" do
        full_cart.remove("Ceasar Salad")
        expect(full_cart.items).to include({ :name => "Ceasar Salad", :price => 3.25, :quantity => 1 })
      end
    end
    context "item passed is an array of dish names" do
      it "removes all items in array to @items" do
        full_cart.remove(["Prime Rib", "Ceasar Salad", "Ceasar Salad", "Lemonade"])
        expect(full_cart.items).to be_empty
      end
      it "updates quantity instead of removing if quantity of item > 1" do
        full_cart.remove(["Prime Rib", "Ceasar Salad", "Lemonade"])
        expect(full_cart.items).to eq [{ :name => "Ceasar Salad", :price => 3.25, :quantity => 1 }]
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
    it "neatly prints all items from @items" do
      expect { full_cart.my_items }.to output("\n#{"Your Cart".center(36)}\n#{"-----------------------------------".center(36)}\n#{"1".ljust(3)}#{"Prime Rib".ljust(24)}: £9.25\n#{"2".ljust(3)}#{"Ceasar Salad".ljust(24)}: £6.50\n#{"1".ljust(3)}#{"Lemonade".ljust(24)}: £1.50\n#{"-----------------------------------".center(36)}\n#{" ".ljust(3)}#{"Total Price".ljust(24)}: £17.25\n\n").to_stdout
    end
  end

  describe "#total" do
    it { is_expected.to respond_to :total }
    it "returns total price of all items in @items" do
      expect(full_cart.total).to eq 17.25
    end
  end

  describe "#my_total" do
    it { is_expected.to respond_to :my_total }
    it "prints total price of all items in @items" do
      expect { full_cart.my_total }.to output("£17.25\n").to_stdout
    end
  end

  describe "#checkout" do
    it { is_expected.to respond_to(:checkout).with(1).argument }
    context "total entered correctly" do
      before do
        allow(fake_sms).to receive(:send_text) { puts "Thank you, your order has been placed! It should arrive before #{(time + (60 * 60)).strftime('%R')}" }
      end
      it "sends confirmation of order (to phone in irb, to console in rspec)" do
        expect { full_cart.checkout(17.25) }.to output("Thank you, your order has been placed! It should arrive before #{(time + (60 * 60)).strftime('%R')}\n").to_stdout
      end
      it "removes all items from cart for next order" do
        full_cart.checkout(17.25)
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
