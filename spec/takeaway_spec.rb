require 'Takeaway'
describe Takeaway do 
  let(:menu) { double("menu", items: [
        { name: "Chicken Wings", price: "3.00" },
        { name: "Burger", price: "4.00" }
        ]) 
  }
  let(:basket) { double("basket", current_order: []) }
  let(:basket_class) { double("basket_class", new: basket) }
  subject { described_class.new(menu) }

  it 'initializes with a menu' do
    expect(subject.menu).not_to be_nil
  end

  it 'initializes with an empty basket' do
    expect(subject.basket.current_order).to eq []
  end
  
  describe '#check_menu' do
    it 'can check the menu and print it, formatted to seperate lines' do
      expect { subject.check_menu }.to output("Chicken Wings: £3.00.\nBurger: £4.00.\n").to_stdout
    end
  end

  describe '#select_item(menu_item)' do 
    it 'takes the name of a dish and adds the full menu item with price to the array' do
      subject.select_item("Chicken Wings")
      expect(subject.basket.current_order).to include({ name: "Chicken Wings", price: "3.00", quantity: 1 })
    end
    it 'can add several different items consecutively' do
      subject.select_item("Chicken Wings")
      subject.select_item("Burger")
      expect(subject.basket.current_order.length).to eq 2
    end
    it 'adds the given quantity of the selected item' do 
      subject.select_item("Chicken Wings", 2)
      expect(subject.basket.current_order).to include({ name: "Chicken Wings", price: "3.00", quantity: 2 })
    end
    it 'raises an error if the menu_item is not on the menu' do 
      expect { subject.select_item("Pad Thai") }.to raise_error "Item not on menu"
    end
  end

  describe '#place_order' do
    it 'raises an error if the order total does not match the sum of the items' do
    end
  end
end
