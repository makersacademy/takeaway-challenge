require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new(order, menu)}
  let(:order) {double :order}
  let(:menu) {double :menu}

  it 'begin with a new order' do
    expect(takeaway.order).not_to be_nil
  end

  it 'begins with a new menu' do
    expect(takeaway.menu).not_to be_nil
  end

  it 'can print the Italian menu' do
    expect(takeaway.print_menu).to eq menu.menu
  end

end
