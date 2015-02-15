require './lib/menu'


describe Menu do

  let(:dish1) {double :dish, price: '6', name: 'Garden salad', category: 'Side dish'}
  let(:dish2) {double :dish, price: '5', name: 'Chocolate fondant', category: 'Dessert'}
  let(:dish3) {double :dish, price: '12', name: 'Meat lasagna', category: 'Main'}
  let(:menu) {Menu.new('Lunch menu')}

  it 'should have a name' do
    expect(menu.name).to eq('Lunch menu')
  end

  it 'should add a dish' do
    menu.add(dish1)
    expect(menu.dishes.count).to eq(1)
  end
  
  it 'should remove a dish' do
    menu.add(dish1)
    menu.remove(dish1)
    expect(menu.dishes.count).to eq(0)
  end

end