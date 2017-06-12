require 'timestamp'

describe Timestamp do

  it 'returns the time without seconds' do
    expect(Timestamp.new.hour_from_now.to_s.gsub(/[1234567890]/, '*')).to eq '**:**'
  end
end
