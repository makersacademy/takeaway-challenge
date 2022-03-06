require 'send_sms'

describe SMS do
  it 'sends a text confirming delivery' do
    expect { subject.send_sms }.not_to raise_error
  end
end
