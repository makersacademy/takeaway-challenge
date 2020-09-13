require 'dish'

describe Dish do
  subject = Dish.new("kebab", 3.50)
  it 'stores the price of a dish' do
    expect(subject.price).to eq 3.50
  end

  it 'stores the name of a dish' do
    expect(subject.name).to eq "kebab"
  end
end
