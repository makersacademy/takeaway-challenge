require 'menu'

describe Menu do

  let(:dish1) { double :dish1, name: "Burrito", price: 5 }
  let(:dish2) { double :dish1, name: "Pizza", price: 10 }
  let(:dish3) { double :dish1, name: "Burger", price: 15 }
  let(:dish_list) { [dish1, dish2, dish3] }
  subject(:menu) { described_class.new(dish_list) }

  let(:printed_menu) { "1. Burrito - £5\n2. Pizza - £10\n3. Burger - £15\n" }

  it 'should be initialised with a list of dishes' do
    expect(menu.dish_list).to eq dish_list
  end

  describe '#list_dishes' do
    it 'should print a list of available dishes' do
      expect { menu.print_menu }.to output(printed_menu).to_stdout
    end
  end
end
