require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'creates the list of items on the menu with prices upon instantiation' do
    expect(menu.dishes).to eq ({ "chicken burger": 3.49, "chicken wings": 4.99, "whole chicken": 10.49, "fries": 1.99, "mozzarella sticks": 1.99 })
  end
end
