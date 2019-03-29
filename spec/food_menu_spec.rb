require 'food_menu'

describe FoodMenu do
  it 'prints all food and drink options' do
    expect(subject.print).to include "Chips"
  end

  it 'has prices for food' do
    expect(subject.pricing(1)).to eq 8
  end
end
