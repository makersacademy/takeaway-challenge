require_relative '../lib/menu'

describe Menu do
    

  let (:dish_1) {double (:dish_1, :name "Fish", :price => 3)}
  let (:dish_2) {double (:dish_2, :name => "Tomatoe Soup", :price => 4)}

  let (:Dish) {double(:Dish))}
  let(:menu) {"Fish, price: 3, Tomatoe Soup, price: 3"}

  
  describe "#select_dishes" do
      it "should allow user to select a number of dishes" do
  menu = Menu.new
  subject(:menu) {described_class.new}
  name_of_dish = "Fish"
  expect(subject.select_dishes).to eq "Fish" 
  end
end