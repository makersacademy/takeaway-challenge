require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:items) { { 'onion bhaji' => 3.99, 'naan' => 2.99 } }
  let(:price) { 3.99 }
  let(:dish) { double(:dish, name: name, price: price) }

  it 'creates a menu' do
    expect(menu.show_menu).to eq items
  end

end

# describe '#add_to_menu' do
#   it 'adds a new item to the menu' do
#     menu.add_to_menu(name, price)
#     expect(menu.show_menu).to include dish
#   end
# end
