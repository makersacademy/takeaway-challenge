require 'menu'


describe Menu do
  subject(:menu) { described_class.new(dishes)}
  let(:dishes) do
    {
      "spring rolls" => 1.20,
      "beef chow mein" => 5.50
    }
  end

    it "has a list of dishes and prices" do
      expect(menu.dishes).to eq(dishes)
    end

    it "prints a list of dishes and prices" do
      menu_choices = "Spring rolls £1.20, Beef chow mein £5.50"
      expect(menu.print_menu).to eq(menu_choices)
    end


end
