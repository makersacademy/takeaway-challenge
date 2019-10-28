require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
    { special_fried_rice: 3.50,
     fried_chicked: 2.99
    }
  end

  it "has a list of dishes with prices" do
    expect(menu.dishes).to eq dishes
  end

end
