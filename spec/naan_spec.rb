require 'naan'

describe Naan do 
  it 'returns the price of a naan' do
    naan = Naan.new
    expect(naan.price).to eq(4)
  end
  it 'returns the name Naan' do
    naan = Naan.new
    expect(naan.name).to eq("Naan")
  end
end
