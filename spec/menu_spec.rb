require 'menu'
describe Menu do

  subject(:menu) {described_class.new}

  it 'should have an empty menu when initialized' do
    expect(menu.options).to be {}
  end

  it 'should allow you to add items to the menu' do
    menu.add_item('pizza', 5.99)
    expect(menu.options).to include('pizza' => 5.99)
  end

  it 'should allow you to remove items from a menu' do
    menu.add_item('pizza', 5.99)
    menu.remove_item('pizza')
    expect(menu.options).not_to include('pizza' => 5.99)
  end

end
