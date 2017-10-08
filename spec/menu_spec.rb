require 'menu'

describe Menu do
  let(:menu) { described_class.new }

  describe '#dishes' do
    it 'has a list of dishes' do
      expect(menu.dishes).to eq([])
    end
  end


  describe '#to_string' do

    it 'passes the dishes to a printer and then returns them as a string' do
      menu.load_menu_from_file
      expect(menu.change_menu_to_string).to eq("1. Burger, £5.00\n2. Cheese Fries, £2.50\n3. Salad, £4.00")
    end
  end

end
