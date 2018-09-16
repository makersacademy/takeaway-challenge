require 'takeaway'

describe Takeaway do

  before(:each) {
    @food = Takeaway.new
  }

  describe '#menu' do
    it "should return a specific menu item and it's price" do
      expect(subject.menu[:Margherita]).to eq(4.99)
    end
  end

  describe '#order' do
    it "should add selected product to order" do
      @food.order("Sausage")
      expect(@food.basket).to eq({ :Sausage => 1 })
    end
    it "should add given amount of selected products to order" do
      @food.order("Sausage", 5)
      expect(@food.basket).to eq({ :Sausage => 5 })
    end
    it "should raise an error if an off menu item is inputted" do
      expect { @food.order("Sandwich") }.to raise_error "We do not sell that item"
    end
  end

  describe '#total' do
    it "should print the sum total so far" do
      @food.order("Sausage", 2)
      expect(@food.total).to eq("£13.98")
    end
  end

  describe '#itemsandprice' do
    it "should give a list of all items added and their costs" do
      @food.order("Sausage", 2)
      @food.order("Pepperoni", 3)
      expect(@food.itemsandprice).to eq("2x Sausage: £13.98, 3x Pepperoni: £20.97")
    end
  end

end
