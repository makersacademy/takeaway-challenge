require 'message'

describe Message do

  subject { described_class.new("Hello") }

  it 'stores message when instance is created' do

    expect(subject.message).to eq ("Hello")

  end

  it { is_expected.to respond_to(:send) }

end
