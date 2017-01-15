describe 'User Stories' do
let(:dish) {double :dish}
let(:quantity) {double :quantity}
let(:price) {double :price}
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
it 'should have the takeaway show a list of prices' do
  list = List.new
  takeaway = Takeaway.new(list)
  expect { takeaway.show_list}.to_not raise_error
end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
it 'should allow the user to select meals' do
  list = List.new
  list.add_dish(dish, price)
  takeaway = Takeaway.new(list)
  expect { takeaway.order_meal(dish, quantity)}.to_not raise_error
end

end
