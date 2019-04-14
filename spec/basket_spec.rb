require 'basket'

describe Basket do

  let(:dish) { double :dish }

  describe "#initialize" do
    it "should initialize with an empty basket" do
      expect(subject.basket).to be_empty
    end
  end

  describe "#add" do
    it { is_expected.to respond_to(:add).with(1).argument }

    it "adds a dish to the basket array" do
      expect(subject.add(dish)).to eq([dish])
    end
  end

# WHY DOESN'T THIS WORK?!
  describe "#total_price" do
    it "calculates the total price of all dishes in the basket" do
      allow(subject).to receive(:basket).and_return([{dish: "A", price: 1}, {dish: "B", price: 2}])
      expect(subject.total_price).to eq(3)
    end
  end

  # describe "#print_basket" do
  #   it "prints the basket contents to the console with a total price" do
  #     allow(subject).to receive(:basket).and_return([{dish: "A", price: 1}, {dish: "B", price: 2}])
  #     expect(subject.print_basket).to output("* A - £1.00\n* B - £2.00\n-----\nTotal: £3.00").to_stdout
  #   end
  # end
end
