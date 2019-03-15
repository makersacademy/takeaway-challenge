### test

require 'takeaway'

describe Takeaway do
  it 'creates new Takeaway' do
    expect(Takeaway.new)
  end

  it { is_expected.to respond_to(:display) }

  let(:takeaway) { Takeaway.new }


end
