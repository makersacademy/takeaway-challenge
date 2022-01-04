require 'menu'

describe Menu do
    subject(:menu) { Menu.new }

   it { is_expected.to respond_to(:dishes, :list) }

   it "has DEFAULT_DISHES" do
    expect(menu.dishes).to eq({
        "1/2 Chicken": 7.95,
        "1/4 Chicken": 4.25,
        "Chicken Burger": 5,
        "Chips": 2.50,
        "Soft Drink": 1.50
    })
   end

    it "lists dishes in the menu and numbers them" do
        expect { menu.list }.to output { 
        "1/2 Chicken £7.95\n1/4 Chicken £4.25\nChicken Burger £5\nChips £2.50\nSoft Drink £1.50\n"
        }.to_stdout
    end
  
end