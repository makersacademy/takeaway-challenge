
require 'take_away'

RSpec.describe TakeAway do
  let(:printed_dish) {'keykey £2.49, waakye £3.99'}
  let(:menu) { double :menu, :list_dishes => printed_dish }
  let(:take_away) { described_class.new(menu)}
  
  let(:dish_on_menu) do
    {
      kenkey: 2.49,
      waakey: 3.99
    }
  end
   
  describe 'show_menu' do
    it 'must be able to show menu' do
      
      expect(take_away.show_menu).to eq(printed_dish)
    end
  end
end