describe 'user stories' do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so a customer can see a list of dishes, it has a menu including those dishes' do
    dishes = {starter: 4.95, main: 8.65, dessert: 5.35}
    takeaway = Takeaway.new(menu: dishes)
    expect(takeaway.show_menu).to eq('Starter: 4.95, Main: 8.65, Dessert: 5.35')
  end

end
