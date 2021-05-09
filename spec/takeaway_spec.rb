require 'takeaway'

describe TakeAway do

  describe "#menu" do
    it "shows a menu of dishes and prices" do
      menu = TakeAway::MENU
      expect(subject.menu).to eq menu
    end
  end

   describe "#select(dish, capacity)" do 
    it "can select a number of dishes" do 
      expect(subject.select("Chicken", 2)).to eq [{ "Chicken" => 19.98 }]  
    end
  end

  describe "#basket_summary" do 
    it "shows the total price of the dishes selected" do
      subject.select("Chicken", 2)
      subject.select("Pizza", 1)
      expect(subject.basket_summary).to eq @order
    end
  end

end

