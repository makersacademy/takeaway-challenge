require 'despatch'

describe Despatch do

  it 'genertes ETA at time + 1' do
    allow(Time).to receive(:now) {Time.new(2016,8,27, 19,13,0)}
    expect(subject.estimate_eta).to eq("20:13")
  end

end
