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

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'can select some number of several available dishes' do
    order = {chicken_tikka_masala: 1, naan: 2}
    expect{ takeaway.select_dishes(order) }.not_to raise_error
  end

  it 'cannot select unavailable dish' do
    expect{ takeaway.select_dishes(bouillabaisse: 5) }.to raise_error 'Bouillabaisse is not available.'
  end
end