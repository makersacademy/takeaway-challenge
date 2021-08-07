require 'restaurant'

describe Restaurant do
  describe '#initialize' do
    it 'has a list of dishes with prices' do
      expect(subject.menu).to_not be_nil
    end
  end

  describe '#see_menu' do
    it 'allows the user to see the dishes' do
      menu = "MENU\n1. Sushi £7\n2. Burger £6\n3. Fries £3\n4. Noodle Soup £10\n5. Bahn Mi £9.25\n"
      expect{ subject.see_menu }.to output(menu).to_stdout
    end
  end

  describe '#select_dish' do
    it 'raises an error if number given is not on the menu' do
      expect{ subject.select_dish(10) }.to raise_error(RuntimeError, "Sorry, that's not on the menu")
    end

    it 'lets the user select dishes' do
      subject.select_dish(3)
      subject.select_dish(4)
      expect(subject.customer_selection).to eq [{ dish: "Fries", price: 3 }, { dish: "Noodle Soup", price: 10 }]
    end
  end

  describe '#place_order' do
    it 'asks the user to select a dish' do
      expect{ subject.place_order }.to output("Choose a menu number to add to your order\n").to_stdout
    end

    it "let's the user select dishes until they're satisfied with their selection" do
      expect{ subject.place_order }.to change{ subject.customer_selection }
    end

    it 'creates a new order' do
      expect(subject.place_order).to be_an(Order)
    end
    
    it 'allows the user to place an order' do
      expect(subject).to respond_to(:place_order)
    end
  end
end
