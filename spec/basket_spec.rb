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

  describe "#add_dish" do
    it 'should add a specified item to the basket' do
      basket = [{ name: "Margherita", quantity: 1, cost: 7.5 }]
      subject.add_dish("Margherita", 1)
      expect(subject.items).to eq basket
    end

    it 'should add higher quantities of items to the basket' do
      basket = [{ name: "Pepperoni", quantity: 10, cost: 85.0 }]
      subject.add_dish("Pepperoni", 10)
      expect(subject.items).to eq basket
    end

    it 'should tell the user if the specified dish cannot be found' do
      message = "Cannot find the specified dish!"
      expect { subject.add_dish("Snail Pizza", 320) }.to raise_error message
    end
  end

  describe "#total" do
    it 'should return the total cost of all items in the basket' do
      subject.add_dish("Gold Pizza", 10)
      subject.add_dish("Truffle", 10)
      expect(subject.total).to eq 12_125
    end
  end

end
