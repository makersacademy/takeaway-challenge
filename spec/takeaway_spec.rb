require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double :menu }

  describe '#initialize' do
    context "testing #new on class" do
      subject(:takeaway_class) { described_class }
      it { is_expected.to respond_to(:new).with(1).argument }
    end

    it 'with a menu object' do
      expect(takeaway.menu).to be_a(Menu)
    end
  end
end
