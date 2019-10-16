require 'menu'

describe Menu do
  it 'displays 1 menu item' do
    menu = Menu.new
    expect { menu.view }.to output("Pizza").to_stdout
  end
end
