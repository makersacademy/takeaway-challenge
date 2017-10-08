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
    dishes = takeaway.dishes
    expect(takeaway.select_meal(:chicken_bhuna, :pilau_rice)).to eq({
      chicken_bhuna: 4.25,
      pilau_rice: 2})
  end
end
