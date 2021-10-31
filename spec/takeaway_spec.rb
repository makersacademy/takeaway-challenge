require 'takeaway'

describe Order do
  let(:empty_basket) { double("empty basket", :empty? => true, :add_item => true, :review_contents => :none) }
  let(:full_basket) { double("full basket", :empty? => false, :review_contents => :full) }
  let(:itemA) { double("itemA", :name => "Egg fried rice", :price => 4.99) }
  let(:itemB) { double("itemB", :name => "Steamed rice", :price => 4.49) }
  let(:itemC) { double("itemC", :name => "Sesame prawn toast", :price => 7.99) }
  let(:itemD) { double("itemD", :name => "Salt & pepper pork ribs", :price => 9.95) }
  let(:itemE) { double("itemE", :name => "Cantonese lemon chicken", :price => 8.95) }
  let(:itemF) { double("itemF", :name => "Lamb in black pepper sauce", :price => 7.99) }
  let(:menu) { double("menu", :import => [itemA, itemB, itemC, itemD, itemE, itemF], 
    :length => 6, :fetch => itemA, :map => [
      "1. #{itemA.name}, £#{itemA.price}",
      "2. #{itemB.name}, £#{itemB.price}",
      "3. #{itemC.name}, £#{itemC.price}",
      "4. #{itemD.name}, £#{itemD.price}",
      "5. #{itemE.name}, £#{itemE.price}",
      "6. #{itemF.name}, £#{itemF.price}"
    ])
  }
  let(:new_order) { Order.new(menu, empty_basket) }
  let(:full_order) { Order.new(menu, full_basket) }

  it { is_expected.to respond_to(:review_basket) }
  it { is_expected.to respond_to(:review_menu) }

  describe "#review_basket" do
    it "shows the contents of @basket" do
      expect(new_order.review_basket).to eq :none
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
