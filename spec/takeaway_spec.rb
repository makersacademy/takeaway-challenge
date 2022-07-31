require 'takeaway'

describe Order do
  let(:menu) { double("menu", :review_menu => :full_menu, :fetch_item => true, :valid_choice? => true) }
  let(:menu_invalid) { double("invalid choice", :valid_choice? => false) }

  let(:empty_basket) { double("empty basket", :empty? => true, :add_item => true, :review_contents => :none) }
  let(:full_basket) { double("full basket", :empty? => false, :review_contents => :full) }

  let(:new_order) { Order.new(menu, empty_basket) }
  let(:new_order_invalid) { Order.new(menu_invalid, empty_basket) }
  let(:full_order) { Order.new(menu, full_basket) }

  let(:timestamp) { double("time: 18:30", :hour => 18, :min => 30) }

  it { is_expected.to respond_to(:review_basket) }
  it { is_expected.to respond_to(:review_menu) }

  describe "#review_menu" do
    it "puts a message to the standard output" do
      expect { new_order.review_menu("test menu") }.to output("test menu\n").to_stdout
    end
  end

  describe "#add_to_basket" do
    it "returns an error if the selected number is not on the menu" do
      expect { new_order_invalid.add_to_basket(0, 1) }.to raise_error "Input error: number doesn't appear in list"
    end

    it "does not return an error if the selected number IS on the menu" do
      expect { new_order.add_to_basket(1, 1) }.to_not raise_error
    end
  end

  describe "#place_order" do
    it "returns an error if a basket is empty" do
      expect { new_order.place_order(timestamp) }.to raise_error "Basket is empty"
    end

    it "does not return an error if a basket is full" do
      expect { full_order.place_order(timestamp) }.to_not raise_error
    end

    it "prints a thank you message with the correct time on successful order" do
      expect(full_order.place_order(timestamp)).to eq "Thank you! Your order will be delivered before 19:30"
    end

  end

end
