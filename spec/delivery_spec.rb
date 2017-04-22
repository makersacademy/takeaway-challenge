require 'delivery'

describe Delivery do

  it 'sets delivery time one hour from current time' do
    expect(subject).to respond_to(:delivery_time)
  end

  it 'sends a text to provide delivery time' do
    expect(subject).to respond_to(:delivery_text)
  end

end
