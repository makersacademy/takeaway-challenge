require 'bhaji'

describe Bhaji do
  it 'returns the price of a bhaji' do
    bhaji = Bhaji.new
    expect(bhaji.price).to eq(4)
  end 
  it 'returns the name bhaji' do
    bhaji = Bhaji.new
    expect(bhaji.name).to eq("Bhajis")
  end 
      
end
