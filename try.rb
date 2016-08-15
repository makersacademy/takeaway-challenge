
describe "everything" do

  it 'works' do
    expect do
      restaurant = Chinese_restaurant.new
      orderer = Orderer.new(restaurant)
      dishes_display = orderer.display_dishes
      orderer.order(dish_number, amount)
      orderer.order(dish_number, amount)
      total = orderer.total
      orderer.confirm
    end.to_not raise_error
  end
end
