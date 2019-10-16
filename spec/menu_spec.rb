require 'menu'

describe Menu do
  it 'displays 1 menu item with a price' do
    menu = Menu.new
    expect { menu.view }.to output("Pizza - £10").to_stdout
  end
end
