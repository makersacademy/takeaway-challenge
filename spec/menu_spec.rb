require 'menu'

describe Dish do 

context "initialize" do

  it "expects number of items to be 0" do
    dish = Dish.new
    expect(dish.number_of_items).to eq(0)
  end  

  it "expects balance to initialize with 0" do
    dish = Dish.new
    expect(dish.total).to eq (0)
  end
end 


context "menu attributes " do

  it "expects menu_list to have a hash list" do 
    dish = Dish.new 
    expect(Dish::MENU_LIST).not_to be_empty
   end 

   it "Dish returns the selected dish prices" do
      dish = Dish.new 
      expect(dish.order).to eq (value)
  end 
end 




describe "Checkout" do
  it "Checkout sums up all the orders that were selected" do
     dish = Dish.new
  expect(dish.checkout).to be()
  end
 
  it "expects selected items add to total"
    dish = Dish.new 
    dish.order 
  expect(dish.selected).to eq()

  end 
end









 # it "" do 
  #   dish = Dish.new
  #   expect(dish.select) 



    # expect(hashes.any? { |hash| hash['foo'] == '2' }).to be_true

  

    # it "expects dish name to be equal to prices" do
      
    # end 

    # it " Expects dishes to be check selected out from the list"
    # dish = Dish.new 
    # expect(dish.checkout).to (array of list )
    

