require 'pizza'

describe Pizza do

  it { is_expected.to respond_to{:view_food_and_price} }

  it "should return a hash as the menu" do
    expect(subject.view_food_and_price).to eq ({
  large_margherita: 15.99,
  small_margherita: 10.99,
  large_veggie: 17.99,
  small_veggie: 12.99,
  garlic_bread: 6.99,
  fanta: 2.99,
  oasis: 2.99
  })
  end

end
