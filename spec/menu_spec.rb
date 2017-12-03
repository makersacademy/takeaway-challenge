require 'menu'

describe Menu do
  it 'should display a menu of items and prices' do
    expect(subject.to_s).to include(:pizza)
  end

  it 'should return a price when provided an item' do
    expect(subject.get_price(:pizza)).to eq 1.15
  end

  it 'should return a price when an item is specified with incorrect case' do
    expect(subject.get_price("PIZZA")).to eq 1.15
  end
end
