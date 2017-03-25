require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:menu) {double :menu}

  it 'displays a list of dishes and prices' do
  	expect(takeaway.view(menu)).to eq menu
  end


end