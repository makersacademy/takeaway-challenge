require 'display'

describe Display do
  let(:display) { Display.new }

  let(:restaurant_double) { double :restaurant }

  let(:dish1) { double :dish }
  let(:dish2) { double :dish }
  let(:dish3) { double :dish }
  let(:order) { double :order }

  before :each do

    allow(dish1).to receive(:name) { "burger" }
    allow(dish1).to receive(:price) { 10 }
    allow(dish1).to receive(:remaining_portions) { 4 }
    allow(dish2).to receive(:name) { "pizza" }
    allow(dish2).to receive(:price) { 7 }
    allow(dish2).to receive(:remaining_portions) { 2 }
    allow(dish3).to receive(:name) { "fish" }
    allow(dish3).to receive(:price) { 12 }
    allow(dish3).to receive(:remaining_portions) { 5 }
    allow(restaurant_double).to receive(:dishes) { [dish1, dish2, dish3] }
    allow(order).to receive(:basket) { [{ :burger => 10 }, { :pizza => 8 }, { :fish => 10.59 }] }
    allow(order).to receive(:basket_total_price) { 28.59 }

  end

  context "#menu" do

    it "iterates through given array and prints dish names, prices
    and number of remaining portions" do
      expected_string = "1. burger (£10), 4 portions remaining\n2. pizza (£7), 2 portions remaining\n3. fish (£12), 5 portions remaining"
      expect { display.menu(restaurant_double) }.to output(expected_string).to_stdout
    end

  end

  context "#basket" do
    it "iterates through given array and prints order basket" do
      expected_string = "Selected items:\n1. burger (£10)\n2. pizza (£8)\n3. fish (£10.59)\nTotal price: £28.59"
      expect { display.basket(order) }.to output(expected_string).to_stdout
    end
  end
end
