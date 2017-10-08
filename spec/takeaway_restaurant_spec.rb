require 'takeaway_restaurant'

describe Takeaway_Restaurant do
  it 'allows you to see a list of dishes with prices' do
    subject.current_dishes
    dishes = subject.dishes
    expect(subject.list_dishes_and_prices(dishes)).to eq ["chicken_bhuna, 4.25",
      "pilau_rice, 2",
      "peshwari_naan, 1.75",
      "creamy_lentils, 3",
      "onion_bhaaji, 2.75"]
  end
end
