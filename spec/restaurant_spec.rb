require 'restaurant'

describe Restaurant do

  subject(:restaurant) { Restaurant.new(menu_dbl) }
  let(:menu_dbl) { double('menu', format: 'formatted menu') }

  it 'stores the given menu' do
    expect(restaurant).to have_attributes(:menu => menu_dbl)
  end

  describe '#format_menu' do
    it "sends a format message to the restaurant's @menu" do
      expect(menu_dbl).to receive(:format).once
      restaurant.format_menu
    end

    it 'returns the formatted menu received from @menu' do
      expect(restaurant.format_menu).to eq(menu_dbl.format)
    end
  end
end
