require 'menu'

describe Menu do

  subject(:menu) {described_class.new}
  let(:dishes) do    {
          "wild boar sandwich" => 7.50,
          "venison pie" => 7.50,
          "beef wellington" => 7.00,
          "pulled pork slider" => 7.00,
          "lobster nicoise" => 9.50,
          "vegan platter" => 7.00
        }
  end

  it 'shows a list of dishes with prices' do
      expect(menu.print_menu).to eq dishes
  end

  it 'knows if items are not on the menu' do
    expect("McDonald's").to raise_error "Not on the menu, please select something tastier!"
  end

end
