require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double :menu }

  it 'displays the menu' do
    expect(takeaway.menu).to eq menu
  end
end
