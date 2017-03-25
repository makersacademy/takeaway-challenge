require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:menu) {double :menu}

  context 'when making an order' do
    it 'displays a menu' do
  	  expect(takeaway.view(menu)).to eq menu
    end

  end


end