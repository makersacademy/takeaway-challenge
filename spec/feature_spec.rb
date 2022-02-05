require 'takeaway'

describe 'Feature-tests' do
  describe "I would like to see a list of dishes with prices" do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
      it 'shows a menu with all the dishes and prices' do 
        dishes = [{pizza: '£9'}, {pasta: '£7'}]
        takeaway = Takeaway.new(dishes)
        expect(takeaway.menu).to eq dishes
      end
  end

  describe "I would like to be able to select some number of several available dishes" do
    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes
      it 'allows multiple dishes to be added to an order' do
        dishes = [{pizza: '£9'}, {pasta: '£7'}]
        takeaway = Takeaway.new(dishes)
        takeaway.add_to_order("pasta")
        takeaway.add_to_order("pizza")
        expect(takeaway.order).to include pasta: "£7"
        expect(takeaway.order).to include pizza: "£9"
      end
  end
end
