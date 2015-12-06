# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe '.DishList' do
  let(:dish1) {Dish.new(name: :pizza, price: 1)}
  let(:dish2) {Dish.new(name: :chicken, price: 2)}
  let(:dish_list) {DishList.new([dish1, dish2])}

describe '#prices' do
  it 'gives a list with the price of each dish' do
    expect(dish_list.prices).to eq ({pizza: 1, chicken: 2})
  end
end



end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
