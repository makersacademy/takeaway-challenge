require 'takeaway.rb'
require 'order'
describe Takeaway do
  subject(:takeaway) {described_class.new(menu: menu, order: order)}
  let(:dishes) {{Margherita: 6.00, Pepperoni: 6.50}}
  let(:order) {double(:order)}
  let(:menu) {double(:menu, print: printed_menu)}
  let(:printed_menu) {double('Margherita: £6.00')}

  it 'shows a list of dishes with prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it ' can order several dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end
end
