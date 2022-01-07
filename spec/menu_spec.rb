require 'menu'

RSpec.describe Menu do
  let (:chips_menu) do
    menu = Menu.new()
    menu.add_dish('Chips', 10)
    break menu
  end
 
  describe '#add_dish' do
    context 'when dish is not yet in menu' do
      it 'adds a dish to the menu' do
        expect(chips_menu.menu).to eq({ 'Chips' => 10 })  
      end
    end
    context 'when dish is already in menu' do
      it 'updates the price' do
        chips_menu.add_dish('Chips', 20)
        expect(chips_menu.menu).to eq({ 'Chips' => 20 })  
      end
    end
  end
  describe '#dish_in_menu?' do
    context 'when dish is in menu' do
      it { expect(chips_menu.dish_in_menu?('Chips')).to be true }
    end
    context 'when dish is not in menu' do
      it { expect(subject.dish_in_menu?('Fish')).to be false}
    end 
  end

end
