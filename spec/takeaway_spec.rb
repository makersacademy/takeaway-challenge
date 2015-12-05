require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) {double :menu}
  context '#menu' do

    it  { is_expected.to respond_to :menu }

  
  end

  it { is_expected.to respond_to(:order).with(1).argument }

  it 'selects items from the menu which is stored as an order' do
    expect(takeaway.order(:salad)).to eq "1* #{:salad} added to your basket"
  end

end
