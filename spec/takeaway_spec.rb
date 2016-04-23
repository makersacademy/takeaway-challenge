require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu)}
  let(:menu) { double :menu, print_menu: printed_menu}
  let(:order) { double :order }
  let(:printed_menu) { "Pizza: £7.99" }
  
  it 'shows the menu' do
    expect(takeaway.show_menu).to eq printed_menu
  end

  # it 'places order' do
  #   allow(order).to receive(:select_dish)
  #   expect(takeaway.place_order(order)).
  # end
end