require 'takeaway'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }

  let(:order) { double(:order) }

  let(:printed_menu) { "Air baked fries 6.75£"}

  let(:dishes) {{ fries: 5, toast: 4}}
  it 'shows the menu' do
    expect(subject.show_menu).to eq(printed_menu)
  end

  it 'can order a several number of dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end
end
