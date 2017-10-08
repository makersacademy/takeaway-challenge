require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new }

  it 'allows you to see a list of dishes with prices' do
    dishes = takeaway.dishes
    expect(takeaway.list_dishes_and_prices(dishes)).to eq ["chicken_bhuna, 4.25",
      "pilau_rice, 2",
      "peshwari_naan, 1.75",
      "creamy_lentils, 3",
      "onion_bhaaji, 2.75"]
  end

  it 'allows you to select a meal' do
    expect(takeaway.select_meal({chicken_bhuna: 1, pilau_rice: 1})).to eq({
      chicken_bhuna: 1,
      pilau_rice: 1})
  end

  it 'checks the price is correct' do
    items_and_quantities = ({chicken_bhuna: 1, pilau_rice: 1})
    dish_prices_and_quantities = ({4.25 => 1, 2 => 1})
    takeaway.select_meal(items_and_quantities)
    takeaway.total_order_price(items_and_quantities)
    expect(takeaway.correct_total_price?(dish_prices_and_quantities)).to eq true
  end
end
