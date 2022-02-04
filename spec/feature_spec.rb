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
end