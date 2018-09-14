require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new  }
  let(:message) { "Thank you! Your order was placed and will be delivered before 18:52\n" }

  describe '#verify_order' do
    before do
      allow($stdout).to receive(:write)
    end

    it { is_expected.to respond_to(:verify_order).with(1).argument }
  end

  describe '#place_order' do
    before do
      allow($stdout).to receive(:write)
    end

    it { is_expected.to respond_to(:place_order).with(1).argument }
    it 'should raise and error when order is not correct' do
      allow(checkout).to receive(:gets).and_return("n\n")
      expect { checkout.place_order(000) }.to raise_error("Bill did not match up")
    end
    xit "prints a receipt" do
      allow(checkout).to receive(:gets).and_return("y\n")
      expect(checkout.place_order(12)).to eq message
    end
  end
end
