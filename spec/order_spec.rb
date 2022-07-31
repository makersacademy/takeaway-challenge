require 'order'
require 'menu'

describe Order do

  it 'can view menu' do
    subject.menu.create_menu
    expect(subject.view).to include(["Cheese", 1.5])
  end

  it 'can add items to basket' do
    subject.menu.create_menu
    subject.add('Cheese', 4)
    expect(subject.basket).to include(['Cheese', 4, 6])
  end

  it 'rejects invalid dishes' do
    subject.menu.create_menu
    expect { subject.add 'Pasta', 1 }.to raise_error ('Sorry this dish is not available')
  end

  it 'works out the correct price' do
    subject.menu.create_menu
    subject.add('Cheese', 3)
    subject.add('Pizza', 1)
    subject.add('Tomatoes', 2)
    expect(subject.total).to eq 13.50
  end

end
