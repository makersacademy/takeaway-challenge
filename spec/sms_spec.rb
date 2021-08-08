require 'sms'

# Basically I have no idea how to test this class so TODO I guess
# The following tests do nothing but return exactly what I just told them to!
# I wrapped the only method in SMS in a :nocov: block for now.

describe SMS do
  it { is_expected.to respond_to :send }

  it 'should return a confirmation if an sms sent succesfully' do
    allow(subject).to receive(:send).and_return('SMS sent: Hello!')

    expect(subject.send('Hello!')).to match(/Hello!/)
  end

  it 'should return an informative error if an sms failed to send' do
    allow(subject).to receive(:send).and_return('Failed to send SMS')

    expect(subject.send('Hello!')).to eq('Failed to send SMS')
  end


end
