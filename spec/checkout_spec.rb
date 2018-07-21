require 'checkout'
describe Checkout do
  describe '#place_order' do
    it { is_expected.to respond_to(:place_order) }
  end
end
