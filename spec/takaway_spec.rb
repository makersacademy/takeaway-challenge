require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu }

  it 'returns a menu of all available dishes' do
    allow(menu).to receive(:dishes).and_return(menu)
    expect(takeaway.menu).to eq menu
  end
end
