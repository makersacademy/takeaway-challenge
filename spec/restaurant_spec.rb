require 'restaurant'

RSpec.describe Restaurant do
  describe "#init" do
    it "creates instance of type Restaurant" do
      restaurant = Restaurant.new  
      expect(restaurant).to be_instance_of Restaurant
    end
  end


  describe "£show_menu" do
    it 'return the menu as a hash' do
      expect(subject.show_menu).to eq({pasta: 7.99, salad: 3.99, roast: 14.99, soup: 4.99})
    end
  end
end

