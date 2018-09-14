require "./lib/takeaway"

describe 'User Stories' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

let(:menu2) {menu2 = {:"1.fish_and_chips" => '£3.20', :"2.burger_and_chips" => '£4.20', :"3.chips" => '£1'}}
  it 'so that takeaway has a menu, display list of dishes with prices' do
    takeaway = Takeaway.new
    expect(takeaway.menu).to eq(menu2)
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

let(:menu2) {menu2 = {:"1.fish_and_chips" => '£3.20', :"2.burger_and_chips" => '£4.20', :"3.chips" => '£1'}}
  xit 'so that I can select meals, add meals to my basket' do
    takeaway = Takeaway.new
    takeaway.add_meal(1)
    expect(takeaway.order).to eq({:"1.fish_and_chips" => '£4.20'})
  end
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
end
