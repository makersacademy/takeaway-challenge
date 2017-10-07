require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new }

  it 'allows you to see a list of dishes with prices' do
    dishes = takeaway.dishes
    expect(takeaway.list_dishes_prices(dishes)).to eq ["chicken_bhuna, 4.25",
      "pilau_rice, 2",
      "peshwari_naan, 1.75",
      "creamy_lentils, 3",
      "onion_bhaaji, 2.75"]
  end
end
