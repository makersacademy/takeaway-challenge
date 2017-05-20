require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'prints out the items on the menu with prices' do
    expect(menu.dishes).to eq ({"quarter chicken": 3.5, "half chicken": 6.0, "whole chicken": 10.50, "small fries": 1.99, "large fries": 2.50})
  end
end
