feature 'list of dishes and prices' do
  scenario 'see all' do
    restaurant = Restaurant.new
    expect(restaurant.dishes).to eq(chicken: '£1', fish: '£1')
  end
end