require 'menu'

describe Menu do

  let(:dish_list) { { dish1: 5, dish2: 10, dish3: 15 } }
  subject(:menu) { described_class.new(dish_list) }

  let(:printed_menu) { "1. dish1 - £5\n2. dish2 - £10\n3. dish3 - £15\n" }

  it 'should be initialised with a list of dishes' do
    expect(menu.dish_list).to eq dish_list
  end

  describe '#list_dishes' do
    it 'should print a list of available dishes' do
      expect { menu.print_menu }.to output(printed_menu).to_stdout
    end
  end
end
