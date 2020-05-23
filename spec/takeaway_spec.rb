require 'takeaway'

describe TakeAway do
  describe '#menu' do
    it { is_expected.to respond_to(:menu) }
  end

  describe '#order' do
    it { is_expected.to respond_to(:order) }

  end
end
