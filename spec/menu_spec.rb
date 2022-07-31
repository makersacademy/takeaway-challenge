require 'menu'

describe Menu do
  before do
    @burger = double("Burger", :name => "Burger", :price => 8.5)
  end

  context "Listing dishes" do
    
    it "Responds to #dishes" do
      expect(subject).to respond_to (:dishes)
    end

    it "Returns a copy of dishes hash" do
      expect(subject.dishes).to eq({
        Fries: 3.0,
        Burger: 8.0,
        CocaCola: 1.5 })
    end
  end
  
end
