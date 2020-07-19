require 'Takeaway'
describe Takeaway do 
  let(:text) { double("textmessage", send_message: true) }
  let(:textmessage) { double("textmessage", new: text) }
  let(:menu) { double("menu", items: [
        { name: "Chicken Wings", price: "3.00" },
        { name: "Burger", price: "4.00" }
        ]) 
  }
  let(:basket_full) { double("basket", current_order: [
    { name: "Chicken Wings", price: "3.00", quantity: 1 },
    { name: "Burger", price: "4.00", quantity: 2 }
    ])
  }
  let(:basket) { double("basket", current_order: []) }
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
    before do 
      subject.basket = basket_full
    end
    
    it 'raises an error if the order total does not match the sum of the items' do
      expect { subject.place_order(basket_full, 13.00, textmessage) }.to raise_error "Incorrect total value"
    end
    it 'does not raise an error if the order total does match the sum of the items' do
      expect { subject.place_order(basket_full, 11.00, textmessage) }.not_to raise_error
    end
    it 'sends confirmation message' do
      expect(textmessage).to receive(:new)
      subject.place_order(basket_full, 11.00, textmessage)
    end
  end
end
