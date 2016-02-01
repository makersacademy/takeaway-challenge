describe 'user stories' do

  let(:takeaway) { Takeaway.new(menu: dishes)}
  let(:dishes)   { {starter: 4.95, main: 8.65, dessert: 5.35} }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so a customer can see a list of dishes, it has a menu including those dishes' do
    expect(takeaway.show_menu).to eq('Starter: 4.95, Main: 8.65, Dessert: 5.35')
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so a customer can choose the dishes they want, it can select some number of the avliable dishes' do
    expect(:order).to receive(:add).twice
    takeaway.place_order(dishes)
  end


end
