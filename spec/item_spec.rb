require 'item'

describe Item do

  it 'initialises with default values if no values are passed in' do
    expect(subject.name).to eq Item::DEFAULT_NAME
    expect(subject.price).to eq Item::DEFAULT_PRICE
  end

end
