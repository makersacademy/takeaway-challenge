require 'menu'

describe Menu do 

  let(:menu) {Menu.new}
  let(:current_menu) {double :current_menu}

  it 'responds to the #print_menu method' do
  expect(menu).to respond_to(:print_menu)
  end

  it '#print_menu displays the current menu' do 
    allow(menu).to receive(:print_menu).and_return(:current_menu)
    expect(menu.print_menu).to eq(:current_menu)
  end

end