require 'Menu'

default_menu = Menu::MENU
describe Menu do
  it 'has default list of dishes' do
    expect(subject.dishes).to include default_menu 
  end

  it '#displays the menu' do
    expect{ subject.display }.to output("Curry House Menu\ndal: £6.5\nkorma: £3\nrice: £2.5\n").to_stdout
  end
end 