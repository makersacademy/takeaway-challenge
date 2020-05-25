require 'menu'

describe Menu do
  let(:menu) { Menu.new }

  it 'should respond to view' do
    expect(menu).to respond_to(:view)
  end

  it 'should print the menu' do
    expect(menu.view).to eq ({"Apple" => 1, "Banana" => 2, "Mango" => 3, "Peach" => 4, "Pear" => 5})
  end
end
