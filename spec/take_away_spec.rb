
require 'take_away'

RSpec.describe TakeAway do
  let(:printed_dish) { 'keykey £2.49, waakye £3.99' }
  let(:menu) { double :menu, :list_dishes => printed_dish, :dishes => dish_on_menu}
  let(:take_away) { described_class.new(menu)}
  let(:order) { double :order, :user_choice }
  
  let(:dish_on_menu) do
    {
      Kenkey: 2.49,
      Waakey: 3.99
    }
  end
   
  describe 'show_menu' do
    it 'must be able to show menu' do
      expect(take_away.show_menu).to eq(printed_dish)
    end
  end

  describe '#select_' do
    it 'allows users to select dishes' do
      expect(take_away.select_(dish_on_menu)).to eq(dish_on_menu)
    end
  end
end