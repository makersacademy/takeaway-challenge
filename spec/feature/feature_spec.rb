require "./lib/takeaway"

describe 'User Stories' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

let(:menu2) {menu2 = {
  "fish and chips" => 3.20, 
  "burger and chips" => 4.20, 
  "chips" => 1,
  }
}

let(:menu3) {menu3 = {
  "fish and chips x1" => 3.20, 
  "burger and chips x2" => 8.40, 
  "chips x3" => 3,
  }
}

let(:dish1_quantity1) { dish1_quantity1 = { "fish and chips x1" => 3.20 } }
let(:dish2_quantity2) { dish2_quantity2 = { "burger and chips x2" => 8.40 } }
let(:dish3_quantity3) { dish3_quantity3 = { "chips x3" => 3 } }


let(:selection1) { selection1 = "fish and chips" }
let(:selection2) { selection2 = "burger and chips" }
let(:selection3) { selection3 = "chips" }

let(:takeaway) {takeaway = Takeaway.new}
  
  it 'so that takeaway has a menu, display list of dishes with prices' do
      expect(takeaway.menu).to eq(menu2)
    end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it 'so that I can a select meal, add that meal to my basket' do
    takeaway.add_meal(selection2, 2)
    expect(takeaway.order).to eq(dish2_quantity2)
  end
    
  it 'so that I can select different meals, add meals to my basket' do
      takeaway.add_meal(selection1, 1)
      takeaway.add_meal(selection2, 2)
      takeaway.add_meal(selection3, 3)
      expect(takeaway.order).to eq(menu3)
    end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'so that I can check the total is the sum of all the dishes in my order' do
    takeaway.add_meal(selection1, 1)
    takeaway.add_meal(selection2, 1)
    takeaway.add_meal(selection3, 1)
    expect(takeaway.total).to eq("£8.40")
  end

  it 'so that I can check the total is the sum of all the dishes in my order' do
    takeaway.add_meal(selection1, 3)
    takeaway.add_meal(selection2, 1)
    takeaway.add_meal(selection3, 1)
    expect(takeaway.total).to eq("£14.80")
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  describe 'once order has been finalised and order can be placed' do 
      it 'so that customers can be notified by sms of there order' do
      allow(takeaway).to receive(:place_order) { 'Thank you! Your ordered was placed. You have ordered {"fish and chips x3" => 9.60, "burger and chips x1" => 4.20, 
        "chips x1" => 1}. The total for your order is: £14.80. Your order will be delivered before 16 of September, 2018 18:52' }
      
      takeaway.add_meal(selection1, 3)
      takeaway.add_meal(selection2, 1)
      takeaway.add_meal(selection3, 1)
      expect(takeaway.place_order).to eq('Thank you! Your ordered was placed. You have ordered {"fish and chips x3" => 9.60, "burger and chips x1" => 4.20, 
        "chips x1" => 1}. The total for your order is: £14.80. Your order will be delivered before 16 of September, 2018 18:52')
      end
  end
end
