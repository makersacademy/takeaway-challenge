require 'dish'

describe Dish do

  let(:big_mac) { described_class.new(name: "Big Mac", price: 2.99) }
  let(:mcmuffin) { described_class.new(name: "mcmuffin", price: 1.99) }

  it 'enforces a options hash must be passed with minimum information' do
    expect { big_mac }.not_to raise_error
  end

  it 'can return the name given in its options hash' do
    expect(mcmuffin.name).to eq "mcmuffin"
    expect(big_mac.name).to eq "Big Mac"
  end

  it 'can return the price given in its options hash' do
    expect(mcmuffin.price).to eq 1.99
    expect(big_mac.price).to eq 2.99
  end
end