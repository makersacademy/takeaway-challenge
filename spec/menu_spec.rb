require 'menu'

describe '#Menu' do
let(:menu) { Menu.new }

  it 'has a list of dishes' do
    print menu.list_of_dishes
    expect(menu.list_of_dishes).to eq(
     "1. Margherita - £8
      2. Salami - £9
      3. Hawaiiaan - £9
      4. Chips - £4
      "
  )
  end
end
