require 'takeaway'

describe Takeaway do

  describe '#menu' do
    it { is_expected.to resoond_to(:menu) }
  end

end
