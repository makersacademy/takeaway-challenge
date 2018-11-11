<<<<<<< HEAD
describe '#user_stories' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it "so that I can order something, see a list of dishes with prices" do
      order = Order.new
      expect { order.dish }.not_to raise_error
  end
end
=======
# describe '#user_stories' do
#
#   dish1 = {dish_name: 'Vegan Fish & Chips', dish_price: '12'}
#   dish2 = {dish_name: 'Vegan Sausages', dish_price: '2'}
# # As a customer
# # So that I can check if I want to order something
# # I would like to see a list of dishes with prices
#   it "so that I can order something, see a list of dishes with prices" do
#       order = Order.new
#       expect { order.list_dishes }.not_to raise_error
#   end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
>>>>>>> 4469e3b... add test for method select dish which adds a dish and quantity to a new order variable
