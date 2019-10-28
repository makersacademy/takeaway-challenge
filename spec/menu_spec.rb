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
      dish.order(0) 
      dish.selected
      expect(dish.total).to eq(30)
  end 

  it "expects to show the list of dishes" do 
    dish = Dish.new
    expect(dish.display_menu).to eq("katsu_Curry - £30")
  end
end 

describe "Checkout" do
  it "Checkout sums up all the orders that were selected" do
     dish = Dish.new
  expect(dish.checkout).to be()
  end
end 

describe "selected" do
  
  it "expects selected items add to total" do
    dish = Dish.new 
    dish.order(1)
    dish.selected 
    expect(dish.total).to eq(20)
  end
  
  it "expects to raise error when attempting to select when items are equal to 0" do
    dish = Dish.new 
    expect { dish.selected }.to raise_error("You have not selected any items")
  end 

  it "expects to display the total of the items" do
    dish = Dish.new 
    expect(dish.show_total).to eq "Your total is £#{total}"
  end

  it "expects add the total number of items to the basket" do 
    dish = Dish.new 
    dish.order(1)
    expect(number_of_items).to eq(number_of_items)  
  end 
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
    

