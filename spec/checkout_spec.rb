require 'checkout'

describe Checkout do
  it 'initializes with an empty basket' do
    expect(subject.basket).to be_empty
  end
  it 'shows the menu' do
    menu = double(:menu)
    allow(menu).to receive(:list).and_return("Foo: 1\/Bar: 5")
    expect(subject.show_menu(menu)).to eq("Foo: 1\/Bar: 5")
  end
  xit 'can place an order' do
  end
  xit 'can create an order' do
  end
  xit 'can send a confirmation text' do
  end
end
