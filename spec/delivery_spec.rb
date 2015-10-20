require 'delivery'

describe 'Delivery' do
  #This seems a silly test - just checks that the Time class is working...
  it 'returns time as a string ' do
    arrival_time = (Time.now+3600).to_s
    expect(Delivery.new.time).to eq arrival_time
  end

end
