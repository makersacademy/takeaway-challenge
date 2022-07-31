require 'rice'

describe Rice do
  it 'returns the price of a rice' do
    rice = Rice.new
    expect(rice.price).to eq(2)
  end 
  it 'returns the name Rice' do
    rice = Rice.new
    expect(rice.name).to eq("Rice")
  end
end