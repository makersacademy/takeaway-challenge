require 'display'

describe Display do
  let(:display) {Display.new}

  let(:restaurant_double) {double :restaurant}

  let(:dish1) {double :dish}
  let(:dish2) {double :dish}
  let(:dish3) {double :dish}

before :each do

  allow(dish1).to receive(:name) {"burger"}
  allow(dish1).to receive(:price) {10}
  allow(dish2).to receive(:name) {"pizza"}
  allow(dish2).to receive(:price) {7}
  allow(dish3).to receive(:name) {"fish"}
  allow(dish3).to receive(:price) {12}
  allow(restaurant_double).to receive(:dishes) {[dish1, dish2, dish3]}

end
  context "#menu" do

    it "it returns a string" do
      expect(display.menu(restaurant_double)).to be_a(String)
    end

    it "iterates through given array and returns string with dish names and prices" do
      expect(display.menu(restaurant_double)).to eq "1. burger (£10)\n2. pizza (£7)\n3. fish (£12)"
    end

  end

end
