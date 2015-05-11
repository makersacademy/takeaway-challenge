require 'menu'

describe Menu do
  it 'can shows a list of dishes with price' do
    menu = Menu.new
    expect(menu.list).to eq ({'red curry' => 5, 'green curry' => 5})
  end

end