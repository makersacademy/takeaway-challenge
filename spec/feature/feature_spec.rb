require "./lib/takeaway"

describe 'User Stories' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

let(:menu2) {menu2 = {
  "fish and chips" => '£3.20', 
  "burger and chips" => '£4.20', 
  "chips" => '£1',
  }
}

let(:dish1) {dish1 = {"fish and chips" => '£3.20'}}
let(:dish2) {dish2 = {"burger and chips" => '£4.20'}}
let(:dish3) {dish3 = {"chips" => '£1'}}


let(:selection1) {selection1 = "fish and chips"}
let(:selection2) {selection2 = "burger and chips"}
let(:selection3) {selection3 = "chips"}

let(:takeaway) {takeaway = Takeaway.new}
  
it 'so that takeaway has a menu, display list of dishes with prices' do
    expect(takeaway.menu).to eq(menu2)
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

it 'so that I can a select meal, add that meal to my basket' do
  takeaway.add_meal(selection2)
  expect(takeaway.order).to eq(dish2)
end
  
it 'so that I can select different meals, add meals to my basket' do
    takeaway.add_meal(selection1)
    takeaway.add_meal(selection2)
    takeaway.add_meal(selection3)
    expect(takeaway.order).to eq(menu2)
  end
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
end
