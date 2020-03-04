require 'order'

describe Order do

  # Doubles for Order class (requires Menu class)
  let(:menu_class) {double("menu", menu_list: {"Cheese Burger" => 5}, existent_dish?: true)}

  # Initialize subject with doubles:
  subject { described_class.new( menu = menu_class ) }

  describe "#initialize" do

    it "initializes with an empty @current_order" do
      expect(subject.current_order).to eq []
    end

    it "initializes with an empty @prices_to_sum" do
      expect(subject.prices_to_sum).to eq []
    end

    it "initializes with @total_price equal 0" do
      expect(subject.total_price).to eq 0
    end
  end

  describe "#add_dish" do

    it "raises an error if #add_dish and it doesn't exist" do
      allow(menu_class).to receive(:existent_dish?).and_return false
      expect { subject.add_dish("pizza", 1) }.to raise_error("Sorry, that dish is not available")
    end

    it "can #add_dish to @current_order" do
      allow(menu_class).to receive(:menu_list).and_return("5")
      subject.add_dish("Cheese Burger", 1)
      expect(subject.current_order).to include("Cheese Burger ...... £5")
    end

    it "can add the price of the dish to @prices_to_sum" do
      subject.add_dish("Cheese Burger", 2)
      expect(subject.prices_to_sum).to include(5)
    end
  end

  describe "#total_price" do
    it "#sum_price returns the @total_price" do
      allow(menu_class).to receive(:menu_list).and_return([5,5])
      # subject.prices_to_sum = [3,3,4] # This will make the test pass but with an attr_accessor
      # subject.add_dish("Cheese Burger", 1)
      # subject.add_dish("Milkshake", 1)
      subject.sum_price
      expect(subject.total_price).to eq 10
    end
  end

  describe "#print_order" do

    it "print_order returns a list with @current_order and @total_price" do
      allow(subject).to receive(:total_price).and_return(15)
      expect { subject.print_order }.to output("Total: £15").to_stdout
    end
  end

  describe "#finish_order" do

    it "can #finish_order" do
    expect(subject).to receive(:sum_price).once
    expect(subject).to receive(:print_order).once
    subject.finish_order
    end
  end


end
