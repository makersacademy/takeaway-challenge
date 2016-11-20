require 'delivery'

describe Delivery do

  it 'sets delivery time one hour from current time' do
    expect(subject).to respond_to(:delivery_time)
  end


end
