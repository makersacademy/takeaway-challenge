require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it 'creates a new instance of menu' do
    expect(menu).to be_a(Menu)
  end
  
  it 'has an Italian menu present' do
    expect(menu.italian_menu).to eq({:pasta => 10,
      :pizza => 15,
      :risotto => 20})
  end

  it 'can print the italian menu' do
    expect(menu.print_menu).to be_a Hash #why can't the menu be printed as is
  end
end
