require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new }
  let(:menu) { double :menu }
  let(:order) { double :order }

  it { expect(restaurant).to respond_to(:menu) }
  it { expect(restaurant).to respond_to(:order) }

  describe '#show_menu' do
    it "shows the menu" do
      allow(menu).to receive(:show).with(Menu::MENU)
      expect(restaurant.show_menu).to eq Menu::MENU
    end
  end

  





end
