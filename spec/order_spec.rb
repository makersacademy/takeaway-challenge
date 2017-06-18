require 'order'

describe Order do
  it { is_expected.to respond_to(:basket) }
  it { is_expected.to respond_to(:menu) }
  it { is_expected.to respond_to(:add).with(2).argument }
  it { is_expected.to respond_to(:review_order) }

  describe "#basket" do
    it "should be an Array" do
      expect(subject.basket).to be_a Array
    end

    it "should be empty upon initialize" do
      expect(subject.basket).to be_empty
    end

  end

  describe "#menu" do
    it "should be an instance of Menu" do
      expect(subject.menu).to be_an_instance_of(Menu)
    end
  end

  describe "#add" do
    context "selecting item from menu" do

      before do
        subject.add("pancakes")
      end

      it "should add the item to the basket" do
        expect(subject.basket).to include("pancakes" => 5)
      end

    end

    context "specifying to add a quantity of an item" do

      before do
        subject.add(2, "pancakes")
      end

      it "should add two of the item to the basket" do
        expect(subject.basket).to eq([{"pancakes" => 5}, {"pancakes" => 5}])
      end

    end

    context "adding an item not on the menu" do
      it "should return an error" do
        expect {subject.add("bananas")}.to raise_error("Sorry, item not on menu!")
      end
    end
  end

  describe "#review_order" do

    context "basket is empty" do
      it "should return an error" do
        expect {subject.review_order}.to raise_error("Please add something to your basket!")
      end
    end

    context "basket contains items" do

      before do
        subject.add("pancakes")
        subject.add("water")
      end

      it "should print the sum of the basket" do
        expect{subject.review_order}.to output{"Your total is £6."}.to_stdout
      end

    end

  end


end
