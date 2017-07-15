require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { described_class::MENU }
  let(:order) { double(:order) }

  it 'starts with an order' do
    expect(takeaway.order).not_to be_nil
  end

  it 'can print the menu' do
    expect(takeaway.view_menu).to eq menu
  end
end
