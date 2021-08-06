require 'restaurant'

describe Restaurant do
  describe '#initialize' do
    it 'has a list of dishes with prices' do
      expect(subject.dishes).to_not be_nil
    end
  end

  it 'it allows the user to see the dishes' do
    expect(subject.dishes).to include({ dish: "Sushi", price: 7.50 }, { dish: "Burger", price: 6.10 })
  end

  describe '#select_dish' do
    it 'lets the user select a dish' do
      expect(subject.select_dish(3)).to eq [{ dish: "Fries", price: 3.00 }]
      expect(subject.selection).to eq [{ dish: "Fries", price: 3.00 }]
    end
  end

  describe '#place_order' do
    it 'allows the user to place an order' do
    end
  end
end
