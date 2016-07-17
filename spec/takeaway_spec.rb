require 'takeaway'

describe Takeaway do

  context 'on initialize' do
    let(:menu) { double :menu }
    subject(:takeaway) { described_class.new(menu) }
    it 'retrieves the menu on which the order will be based' do
      expect(takeaway.menu).to eq menu
    end
    it 'creates a holder for the coming order' do
      expect(takeaway.order).to be_empty
    end
  end

end
