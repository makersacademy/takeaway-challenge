require_relative '../lib/restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: show_menu) }
  let(:show_menu) { "Tiramisu: £3.65" }
  it 'shows the menu with prices' do 
    expect(subject.show_menu).to eq(show_menu)
  end
end
