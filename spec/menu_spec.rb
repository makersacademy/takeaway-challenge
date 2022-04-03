require_relative '../lib/menu'

describe Menu do
  menu = Menu.new({ Croissant: 1.00, 'Custard tart': 2.00, 'Pain au chocolat': 1.50 })

  it 'displays a numbered list of options with prices in pounds' do
    expect(menu.display).to eq ['Croissant, £1.00', 'Custard tart, £2.00', 'Pain au chocolat, £1.50']
  end
end
