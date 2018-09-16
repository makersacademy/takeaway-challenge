require 'order'

describe Order do
  describe '#add' do
    it { is_expected.to respond_to(:add).with(1).argument }

  end

  describe '#calculate' do
    it { is_expected.to respond_to(:calculate) }
  end
end
