require 'time'

describe Time do
  it 'displays the time 1 hour from now' do
    time_double = double :time, time_in_an_hour: :time_later
    expect(time_double.time_in_an_hour).to eq :time_later
  end

end
