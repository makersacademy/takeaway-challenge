require 'menu'
require 'capybara/rspec'

feature 'Listing and Ordering:' do
  let(:menu) { Menu.new }
  let(:checkout) { Checkout.new }
  before do
    allow(menu).to receive(:send_message)
  end
  scenario 'Customer asks for a list' do
    expect(menu.list).to eq(Burger: 5, Pizza: 10, Coke: 1)
  end

  scenario 'Customer adds an item to their basket from the list' do
    menu.add(:Burger)
    expect(menu.current_order).to eq(Burger: 1)
  end

  scenario 'Customer adds multiple items from the list' do
    menu.add(:Burger, 2)
    menu.add(:Coke)
    expect(menu.current_order).to eq(Burger: 2, Coke: 1)
  end

  scenario 'Customer adds item not on the menu' do
    expect do
      menu.add(:Lobster)
    end.to raise_error 'Sorry, that item isn\'t on our menu'
  end

  scenario 'Customer checks out their items' do
    menu.add(:Burger)
    menu.add(:Pizza)
    expect(menu.complete).to eq 'You ordered: Burger: 1 Pizza: 1 at a cost of'\
                                ': £15'
  end
end
