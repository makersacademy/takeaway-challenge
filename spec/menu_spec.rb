
require_relative '../lib/menu.rb'

describe Menu do
  let(:dish1) { double(:dish, name: 'Pretzels', description: 'These pretzels are making me thirsty!', price: 2) }
  subject(:menu) { Menu.new }

  it 'can have new dishes added to it' do
    subject.add_dishes_to_menu(dish1)
    expect(subject.dishes).to include(dish1)
  end

  it 'can have dishes removed from it' do
    subject.add_dishes_to_menu(dish1)
    subject.remove_dish_from_menu(dish1)
    expect(subject.dishes).not_to include(dish1)
  end
end