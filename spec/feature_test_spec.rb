
describe 'User Stories -' do

  let(:takeaway)  { Takeaway.new }

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'customer will be able to see a list of dishes including prices' do
    takeaway.add_dish("Dish1", 5)
    expect(takeaway.show_menu).to eq([{:name => "Dish1", :price => 5}])
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  it 'customer will be able to select a few dishes from several available' do
    takeaway.add_dish("Dish1", 5)
    takeaway.add_dish("Dish2", 2)
    takeaway.add_dish("Dish3", 4)
    expect(takeaway.add_to_order("1,3")).to eq([{:name => "Dish1", :price => 5}, {:name => "Dish3", :price => 4}])
  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
 it 'customer can verify order the total will be added up' do
   takeaway.add_dish("Dish1", 5)
   takeaway.add_dish("Dish2", 2)
   takeaway.add_dish("Dish3", 4)
   takeaway.add_to_order("1,3")
   expect(takeaway.total_order).to eq ("Your total - £9")
 end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

end
