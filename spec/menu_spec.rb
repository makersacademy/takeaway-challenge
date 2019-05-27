require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  it 'initializes with a list of dishes and prices' do
    expect(menu.list_menu).to eq({ :pizza => 4.00, :sausage => 2.00, :curry => 6.50, :rice => 2.00, :chilli => 6.00, :salad => 3.50 })
  end
end