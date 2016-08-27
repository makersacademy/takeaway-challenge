require 'foodorder'

describe FoodOrder do

subject{ described_class.new(["ham", "jam","potatoes"], 3, 9.50) }

  it 'initializes with a list of dishes' do
    expect(subject.selection).to include "potatoes"
  end

  it 'initializes with a quantity of those dishes' do
    expect(subject.quantity).to eq 3 #defined in subject
  end

  it 'initializes with a total expected price' do
    expect(subject.price).to eq 9.50
  end
end
