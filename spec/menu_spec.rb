require 'menu'

describe Menu do
  it 'can view the menu' do
    expect(subject.dishes).to eq Menu::MENU
  end

  it 'displays menu when called' do
    output = 'Avocado Maki - £6, Beef Teriyaki - £10, California Temaki - £5, Chicken Katsu Curry - £11'
    expect(subject.view_menu).to eq output
  end
end
