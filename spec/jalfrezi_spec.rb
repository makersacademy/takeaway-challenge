require 'jalfrezi'

describe Jalfrezi do 
  it 'returns the price of a jalfrezi' do
    jalfrezi = Jalfrezi.new
    expect(jalfrezi.price).to eq(10)
  end
  it 'returns the name Jalfrezi' do
    jalfrezi = Jalfrezi.new
    expect(jalfrezi.name).to eq("Jalfrezi")
  end
end
