require 'menu'

describe Menu do

  subject(:menu) { Menu.new(dishes) }
  let(:dishes) do { "Ramen" => 2 }
  end

  describe '#list_dishes' do
    it "gives back all available dishes" do
      expect(menu.list_dishes).to eq dishes
    end
  end

  describe '#print_menu' do
      it "prints the list of dishes in a readable format" do
        expect(menu.print_menu).to eq dishes
      end
  end

end
