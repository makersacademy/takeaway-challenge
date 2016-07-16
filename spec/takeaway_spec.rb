require 'takeaway'

describe Takeaway do

  let(:subject) {Takeaway.new}

  it { is_expected.to respond_to(:menu) }

#  describe '#menu' do
#    it 'when customer want to order it shows the menu'
#    expect(subject.menu).
  #end
end
