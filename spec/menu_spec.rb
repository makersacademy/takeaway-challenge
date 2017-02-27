require 'menu'
require 'restaurant'

describe Menu do
  let(:menu_double) do ([
    { :food => 'tofu', :price => '9'},
    { :food => 'peanuts', :price => '5' },
    ])
  end
  let(:restaurant) { Restaurant.new }
  subject(:menu) { described_class.new(restaurant) }

  describe "Viewing the menu" do
    before do
    allow(restaurant).to receive(:menu).and_return(menu_double)
  end
    it "shows the dishes from the restaurant" do
      expect(menu.view).to eq (menu_double)
    end
  end
end
