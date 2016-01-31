require 'order'

describe Order do
  subject(:order) { described_class.new(dishes) }
  let(:dishes)    { double :hash }

  describe '#initialize' do

  end

  describe '#verify' do
    it { is_expected.to respond_to(:verify) }
  end
end
