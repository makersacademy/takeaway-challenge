require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: menu_output) }
  let(:order) { double(:order) }
  let(:menu_output) { "Meal: Price" }

  let(:dishes) { {burger: 2, vege: 1} }

  context 'menu' do
    it 'shows the menu including dishes and prices' do
      expect(takeaway.provide_menu).to eq(menu_output)
    end
  end

  it 'can order some dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)

  end
end
