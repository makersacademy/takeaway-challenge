require_relative '../docs/lib/basket' 

describe Basket do 
  TRIAL_DISH_1 = 1
  TRIAL_DISH_2 = 2
  
  before do 
    subject.add_to_basket(TRIAL_DISH_1) 
  end 
  
  describe '#add_to_basket()' do 
    it "adds the dish selection to the basket" do  
      expect(subject.basket).not_to be_empty
    end
  end 
 
  describe '#add_cost' do 
    it "correctly adds the cost of the selectd dishes " do 
      subject.add_to_basket(TRIAL_DISH_2)
      expect(subject.total_cost). to eq(5.50 + 2.50)
    end 
  end 
  
end