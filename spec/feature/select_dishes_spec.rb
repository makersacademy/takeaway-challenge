feature 'select dishes' do
  scenario 'select one dish' do
    restaurant = Restaurant.new
    order = restaurant.order(:chicken, 3)
    expect(order.total).to eq('£3')
  end
end