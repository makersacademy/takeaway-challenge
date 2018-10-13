require 'basket'

describe Basket do
  let(:menu) { double(:menu, dishes: [{ "Margherita" => 7.5 },
                                      { "Bufala" => 8 },
                                      { "Anchovy" => 8 },
                                      { "Pepperoni" => 8.5 },
                                      { "Calabria" => 8.5 },
                                      { "Quattro Formaggi" => 10 },
                                      { "Truffle" => 12.5 },
                                      { "Gold Pizza" => 1200 }
  ])
  }
  let(:subject) { Basket.new(menu) }

  it 'should be able to store a list of items' do
    expect(subject.items).to be_empty
  end

  it 'should add a specified item to the basket' do
    basket = [{ name: "Margherita", quantity: 1, cost: 7.5 }]
    subject.add_dish("Margherita", 1)
    expect(subject.items).to eq basket
  end
end
