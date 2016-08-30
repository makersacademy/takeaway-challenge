require 'menu'

describe Menu do

  context 'on initialize' do
    let(:dishes) { double :dishes }
    let(:menu) { described_class.new(dishes) }
    it 'creates holder for list of dishes loaded with current menu' do
      expect(menu.current_menu).to eq dishes
    end
  end
#
#   context 'on adding a dish to the menu' do
#     let(:dish) { double :dish }
#     it 'raises an exception if dish already exists on the menu' do
#       # expect(subject.dish_on_menu?(dish)).to be false
#       expect{ subject.add_to_menu(dish) }.to raise_error "Dish already on menu"
#     end
#     it 'then adds a new item to the list of dishes' do
#       subject.add_to_menu(dish)
#       expect(subject.items).to include dish
#     end
#   end
#
end
