require 'order_log'

describe OrderLog do

  it {is_expected.to respond_to(:add).with(2).arguments}

  subject(:order_log) {OrderLog.new}

  describe '#list' do
    it 'starts empty' do
      expect(order_log.list).to be_empty
    end
  end

  # describe '#add' do


end
