require 'order'

describe Order do

  it 'allows user to order a few items and returns the price' do
    expect(subject.new("Fish", "Chips", "Salad")).to eq £10
  end

end
