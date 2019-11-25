require 'takeaway.rb'

describe Takeaway do 

  context "#initialize" do
    it "basket empty by default" do
      expect(subject.basket.length).to eq(0)
    end
  end


  context "#display_menu" do
    it "shows the menu" do
      expect(subject.display).to respond_to(:display)
    end
  end


  context "#select_dish" do
   
    it "select two items put and them into the baskets" do
      subject.select_dish 1, 2
      expect(subject.basket.length).to eq(2)
    end

    it "select a item and put it into the bask" do
      subject.select_dish 1, 1
      expect(subject.basket.length).to eq(1)
    end

  end

end