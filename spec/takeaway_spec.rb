### test

require 'takeaway'

describe Takeaway do
  it 'creates new Takeaway' do
    expect(Takeaway.new)
  end

  it { is_expected.to respond_to(:list)}

  let(:takaway) {Takeaway.new}

end
