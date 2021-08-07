require 'restaurant'

describe Restaurant do
  describe '#initialize' do
    it 'has a list of dishes with prices' do
      expect(subject.dishes).to_not be_nil
    end
  end

  describe '#enter_restaurant' do
    it 'shows the menu to the customer' do
      menu = "MENU
      1. Sushi £7.50
      2. Burger £6.10
      3. Fries £3.00
      4. Noodle Soup £10.00
      5. Bahn Mi £9.25"
      expect(subject.enter_restaurant).to output(menu).to_stdout
    end
  end

  it 'it allows the user to see the dishes' do
    expect(subject.dishes).to include({ dish: "Sushi", price: 7.50 }, { dish: "Burger", price: 6.10 })
  end

  describe '#select_dish' do
    it 'lets the user select dishes' do
      subject.select_dish(3)
      subject.select_dish(4)
      expect(subject.customer_selection).to eq [{ dish: "Fries", price: 3.00 }, { dish: "Noodle Soup", price: 10.00 }]
    end
  end

  describe '#place_order' do
    it 'creates a new order' do
      expect(subject.place_order).to be_an(Order)
    end
    
    it 'allows the user to place an order' do
      expect(subject).to respond_to(:place_order)
    end
  end
end
