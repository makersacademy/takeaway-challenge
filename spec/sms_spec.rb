require './lib/sms'

describe SMS do
  it 'has a destination number' do
    expect(subject.destination_set?).to eq true
  end

  it 'has a message body' do
    expect(subject.message_set?).to eq true
  end

  it 'sends an sms confirmation' do
    allow(subject).to receive(:send).and_return(true)
    expect(subject.send).to eq true
  end

end
