require 'chai'

describe Chai do 
  it 'returns the price of a cup of chai' do
    chai = Chai.new
    expect(chai.price).to eq(2)
  end
  it 'returns the name Chai' do
    chai = Chai.new
    expect(chai.name).to eq("Chai")
  end 
end
