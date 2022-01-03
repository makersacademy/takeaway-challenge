require 'menu'

default_menu = Menu::MENU
describe Menu do
 
  it 'has default menu if an alternative menu is not given' do
    expect(subject.dishes).to eq default_menu 
  end  

    it '#displays the menu' do
    expect{ subject.display }.to output("Curry House Menu\ndal: £6.50\nkorma: £3.00\nrice: £2.50\n").to_stdout
  end

  it 'can add dishes to menu' do
    subject.add_dish("jalfrezi", 12.00)
    expect(subject.dishes).to include "jalfrezi" => 12.00
  end

end 