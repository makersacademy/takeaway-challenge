require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  context '#print_menu'
  it 'displays a list of available items' do
    expect(menu.print_menu)
  end

  context '#add_to_basket'
  it 'pushes the selected items into the basket array' do
    expect{menu.add_to_basket("Buckwheat Shamalam")}.to change{menu.basket}.to(["Buckwheat Shamalam, 5.00"])
  end
end
