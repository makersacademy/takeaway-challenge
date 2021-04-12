require 'menu'

describe Menu do
  subject(:menu) { described_class.new(meal) }
  let(:meal) { { :"Chicken Katsu" => 20, :"Spring rolls" => 10 } }

  it 'allows to store a menu' do
    expect(menu.meal).to eq(meal)
  end

  it 'allows to display a menu' do
    menu_list = "Chicken Katsu: £20, Spring rolls: £10"
    expect(menu.display).to eq(menu_list)
  end
end
