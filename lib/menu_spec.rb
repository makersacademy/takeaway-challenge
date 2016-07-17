require 'menu'

describe Menu do
subject(:menu) {described_class.new}
let(:dish1) {double :dish, name: "Pad Thai", price: 5}
let(:dish2) {double :dish, name: "Dumplings", price: 6}


describe '#add_dish' do
  it 'will add a dish to the menu' do
    menu.add_dish(dish1)
    menu.add_dish(dish2)
    expect(menu.dishes).to include(dish1, dish2)
  end

end



end
