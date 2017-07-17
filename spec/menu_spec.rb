require 'menu'

describe Menu do
  subject(:menu) {Menu.new}
  it 'should print the list of dishes' do
    expect(menu.print_menu).to eq "Pig's.brain is at £8
Rosted.frog is at £10
Camel.Curry is at £11.5
Dolphin.salami is at £12.5
Battered.axololt is at £5.5"
  end
end
