require 'order'

describe Order do

  describe '#add' do
    it { is_expected.to respond_to(:add).with(2).arguments }
  end

  describe '#calculate' do
    it { is_expected.to respond_to(:calculate) }
  end

end