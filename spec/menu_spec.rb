require_relative '../lib/menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
    tiramisu: 3.65,
    nutella_cheesecake: 6.15,
    coke: 3.35,
    appletiser: 3.25,
    san_pellegrino_water: 2.90,
    bruschetta: 6.45,
    garlic_bread: 6.15,
    risotto: 11.95, 
    lasagne: 13.45,
    arrabbiata: 9.95,
    bolognese: 12.95,
    pomodoro: 11.95,
    margherita: 10.45,
    calzone: 15.45,
    verdure: 11.45
    }

  end
  it "has contains a list of dishes and their prices" do
    expect(subject.dishes).to eq(dishes)
  end
end
