require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      chicken: 5,
      potato: 4
    }
  end
  it ' displays the dishes on the menu' do
    printed_menu = "Chicken: £5, Potato: £4"
    expect(subject.display_menu).to eq(printed_menu)
  end
end
