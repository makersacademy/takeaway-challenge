require 'text'

describe Text do
  it { is_expected.to be_instance_of(described_class) }
  it { expect(subject).to respond_to(:send_message).with(1).argument }
end