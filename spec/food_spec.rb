require 'food'

describe Food do
  let(:subject) { Food.new('chicken', 5.00) }
  it 'shows the name of the food' do
    expect(subject.name).to eq 'chicken'
  end

  it 'shows the price of the food' do
    expect(subject.price).to eq 5.00
  end
end
