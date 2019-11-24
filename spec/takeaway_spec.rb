require "takeaway"

describe Takeaway do

  describe "#initialze" do
    it "creates an array called menu on initalize" do
      expect(subject.menu).to be_a(Hash)
    end
  end

  describe "#show_menu" do
    it "return a hash of food items and their price" do
      expect(subject.show_menu).to eq({"Chicken Chow Mein"=>6.5, "Egg Fried Rice"=>4.8}) # It's returning a hash I dont know why??
    end
  end

  describe "#order" do
    # before(:all) do
    #   food = Takeaway.new
    #   food.stub(:gets).and_return( "1\n")
    # end

    it "should take user input for the item ordered and store it to a variable" do
      # subject.order.stub(gets: "1\n")
      subject.order("Chicken Chow Mein")
      expect(subject.order_item).to eq("Chicken Chow Mein")
    end

    it "should take user input for the price of the order and store it to a variable" do
      # subject.stub(:gets).and_return( "1\n")
      subject.order("Chicken Chow Mein")
      expect(subject.order_price).to eq(6.5)
    end
  end

end
