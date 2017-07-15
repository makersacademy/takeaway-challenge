require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new}
  let(:menu) { described_class::MENU}

  it 'can print the menu' do
    expect(takeaway.view_menu).to eq menu
  end








end
