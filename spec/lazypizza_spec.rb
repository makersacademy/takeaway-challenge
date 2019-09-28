require 'lazypizza'

describe LazyPizza do

  describe '#show_menu'
  it 'displays the menu' do
    pizza = LazyPizza.new
    expect(pizza.show_menu).to include :pizza
  end
end