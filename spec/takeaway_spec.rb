require 'takeaway'
require 'order'

describe Takeaway do
  subject(:takeaway) { described_class.new}
  let(:menu) { described_class::MENU}


  it 'starts with no order' do
    expect(takeaway.customer_order).to eq nil
  end


  it 'can print the menu' do
    expect(takeaway.view_menu).to eq menu
  end

end
