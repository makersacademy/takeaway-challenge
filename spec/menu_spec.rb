require 'menu'

describe Menu do
  it 'has some dishes' do
    menu = Menu.new
    expect(menu.dishes).not_to be_empty
  end

  it 'looks good when printed' do
    expect do
      Menu.new.print_menu
    end.to output("Menu:\nPotato: £1.00\n").to_stdout
  end
end
