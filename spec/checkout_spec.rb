#absolutely terrible spec file - still have no clue on mocking
require 'checkout'
describe Checkout do
  subject(:checkout) { described_class.new  }

  describe '#place_order' do
    before do
      allow($stdout).to receive(:write)
    end

    it { is_expected.to respond_to(:place_order).with(1).argument }
    it '' do
      allow(checkout).to receive(:gets).and_return("n\n")
    end
  end

  describe '#verify_order' do
    before do
      allow($stdout).to receive(:write)
    end

    it { is_expected.to respond_to(:verify_order).with(1).argument }
    it '' do
      allow(checkout).to receive(:gets).and_return("n\n")
    end
  end
end
