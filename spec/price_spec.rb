require 'price'

describe Price do
  it 'can format a price' do
    expect(Price::format(999)).to eq("9.99")
    expect(Price::format(5349)).to eq("53.49")
    expect(Price::format(9)).to eq("0.09")
    expect(Price::format(60)).to eq("00.60")
    expect(Price::format(53)).to eq("00.53")
    expect(Price::format(23490423)).to eq("234904.23")
  end
end
