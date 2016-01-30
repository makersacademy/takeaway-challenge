require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  
  it {expect(menu).to respond_to(:dishes)}
  
  it 'stores a list of dishes' do
    expect(menu.dishes).to include "Egg Fried Rice"
  end
end