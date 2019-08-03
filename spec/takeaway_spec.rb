require_relative '../lib/takeaway.rb'

describe Takeaway do
  let(:order) {double(:order)}
  let(:dishes) {{kimchi: 3, bibimbap: 2, soju: 1}}
  let(:menu_list) {'Spaghetti: £4.50'}
  let(:menu) {double(:menu, show: menu_list)}
  subject(:takeaway) {described_class.new(menu: menu, order: order)}

  it 'display list of the dishes with prices' do
    expect(takeaway.show_menu).to eq('Spaghetti: £4.50')
  end

  it 'can place an order of few dishes' do
    expect(order).to receive(:add).at_least(:once)
    expect(takeaway.order_dish(dishes))
  end
end