require 'takeaway'

describe Order do
  let(:item) { double("itemA", :name => "Egg fried rice", :price => 4.99) }
  let(:menu) { double("menu", :length => 6, :review_menu => :full_menu, :fetch => item) }
  let(:empty_basket) { double("empty basket", :empty? => true, :add_item => true, :review_contents => :none) }
  let(:full_basket) { double("full basket", :empty? => false, :review_contents => :full) }

  let(:new_order) { Order.new(menu, empty_basket) }
  let(:full_order) { Order.new(menu, full_basket) }

  it { is_expected.to respond_to(:review_basket) }
  it { is_expected.to respond_to(:review_menu) }

  describe "#review_basket" do
    it "shows the contents of @basket" do
      expect(new_order.review_basket).to eq :none
    end
  end

  describe "#review_menu" do
    it "shows the contents of @menu" do
      expect(new_order.review_menu).to eq :full_menu
    end
  end

  describe "#add_to_basket" do
    it "returns an error if the selected number is not on the menu" do
      expect { new_order.add_to_basket(0, 1) }.to raise_error "Input error: number doesn't appear in list"
    end

    it "returns an error if a number isn't passed as an argument" do
      expect { new_order.add_to_basket("ten", 1) }.to raise_error "Input error: number doesn't appear in list"
    end

    it "can add multiple item to basket" do
      expect(new_order.add_to_basket(2, 5)).to eq 5
    end
  end

  describe "#place_order" do
    it "returns an error if a basket is empty" do
      expect { new_order.place_order }.to raise_error "Basket is empty"
    end

    it "does not return an error if a basket is full" do
      expect { full_order.place_order }.to_not raise_error
    end

    it "prints a thank you message with the correct time on successful order" do
      dum_time = instance_double("time", :hour => 17, :min => 52)
      expect(full_order.place_order(dum_time)).to eq "Thank you! Your order was placed and will be delivered before 18:52"
    end

  end

end
