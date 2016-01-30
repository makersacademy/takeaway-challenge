require 'takeaway'

describe 'User Stories' do
  let(:takeaway) { Takeaway.new(dishes) }
  let(:dishes) { {onion_bhaji: 2.95, chicken_tikka_masala: 7.95, naan: 1.95} }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'displays a list of dishes with prices' do
    expect(takeaway.dishes).to eq dishes
  end
end