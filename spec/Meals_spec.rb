require './lib/Meals'

describe Meals do
  subject(:meals) { Meals.new }

  it { is_expected.to be_instance_of(Meals) }
  it { is_expected.to respond_to(:order) }
  it { is_expected.to respond_to(:check_order) }
  it { is_expected.to respond_to(:compare_order) }

  it 'should find the dishes' do
    expect(meals.dishes).to eq([
      { meal: 'Soup', price: 1.50 },
      { meal: 'Fish and Chips', price: 3.00 },
      { meal: 'Curry', price: 3.25 }
    ])
  end
end
#   it 'should display the dishes and their prices' do
#     expect { print(meals.menu) }.to output("Soup : 1.50\nFish and Chips : 3.00\nCurry : 3.25").to_stdout
#   end
#
#   it 'should find a dish and add to order' do
#     meals.order('Soup')
#     expect(meals.ordered).to eq(['Soup'])
#   end
#
#   it 'should return the order for viewing' do
#     meals.order('Soup')
#     expect { print(meals.check_order) }.to output('Soup : 1.50').to_stdout
#   end
# end
