require 'menu'
require 'bigdecimal'

describe Menu do
  subject(:menu){ described_class.new(dishes) }
  let(:dishes) do
    [
      {'Vegan McChicken': 5.55 },
      {'Yum Yum fries': 2.35 },
      {'McChocolate': 2.99 },
      {'Big Steak Patty': 5.89 }
    ]
  end

  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq dishes
  end

  describe "#print_menu" do

    it 'prints a list of dishes with prices' do
      printed = "1. Vegan McChicken: £5.55\n2. Yum Yum fries: £2.35\n3. McChocolate: £2.99\n4. Big Steak Patty: £5.89\n"
      expect{menu.print_menu}.to output(printed).to_stdout
    end
end

end
