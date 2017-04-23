require 'menu'

describe Menu do

  let(:dish_1) { double :dish, name: 'Fruit Basket', price: 10.99 }
  let(:dish_2) { double :dish, name: 'Salad Nicoise', price: 14.99, present: { "Salad Nicoise" => 14.99 } }
  let(:dish_3) { double :dish, name: 'Shrimp Fettuccini', price: 18.99, present: { "Shrimp Fettuccini" => 18.99 } }

  let(:menu) { described_class.new([{ dish_1.name => dish_1.price }, { dish_2.name => dish_2.price }]) }

  it 'can have dishes added to it' do
     expect { menu.add(dish_3) }.to change{menu.list_of_dishes.count}.from(2).to(3)
  end

  it 'can have dishes removed from it' do
     expect { menu.remove(dish_2) }.to change{menu.list_of_dishes.count}.from(2).to(1)
  end

  it 'cannot lose dishes that it does not contain' do
    message = "Menu does not contain that dish"
    expect { menu.remove(dish_3) }.to raise_error message
  end

  it 'prints a list of dishes' do
    expect(menu.print_list).to eq "#{dish_1.name} - £#{dish_1.price}\n#{dish_2.name} - £#{dish_2.price}"
  end

end
