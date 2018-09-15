require 'order'

describe Order do

  describe '#add' do
    it { is_expected.to respond_to(:add).with(2).argument }
  end

end