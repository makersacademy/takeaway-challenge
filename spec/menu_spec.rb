require 'menu'

describe Menu do

  subject(:menu)  { described_class.new(list_of_dishes) }

  let(:list_of_dishes) do
    {
      balti: 5.00,
      vindaloo: 4.50
    }
  end

    it "has a list of menu items, with prices" do
      expect(menu.list_of_dishes).to eq(list_of_dishes)
    end



    it "prints out a list of menu dishes and their prices" do
      printed_menu = "Balti £5.00, Vindaloo £4.50"
      expect(menu.print_menu).to eq(printed_menu)
    end
end
