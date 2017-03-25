require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'initialized with a list of dishes and prices' do
    expect(menu.dishes).to eq SmarterCSV.process('./Mann_Fang_Lowe_Menu.csv')
  end

  it 'displays a list of dishes with prices' do
    expect( menu.view ).to eq SmarterCSV.process('./Mann_Fang_Lowe_Menu.csv')
  end

end
