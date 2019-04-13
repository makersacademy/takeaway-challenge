require 'take_away'

RSpec.describe TakeAway do
  let(:menu) { double :Menu, show_dish: 'keykey and shito £4' }

  let(:take_away) { described_class.new(menu) }

  describe '#show_menu' do
    it 'shows list of menu' do 
      expect(take_away.show_menu).to eq(menu.show_dish)
    end
  end
end
