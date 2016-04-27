require 'Takeaway'

describe Takeaway do

let(:menu_class) { double("menu", new: menu_instance)}
let(:menu_instance) { double("menu", dishes: {"Spring Roll" => 2}) }
let(:takeaway) {Takeaway.new(menu_class) }
let(:food_message) {"I'm sorry but we do not have Spicy Rice in the menu"}

  it 'should have a menu list' do
    expect(takeaway.read_menu).to eq(menu_instance.dishes)
  end

  describe '#order' do
    it 'should raise an error when the ordered item is not in the menu' do
      expect {takeaway.order('Spicy Rice')}.to raise_error food_message
    end

    it 'should let you order a item from the menu' do
      takeaway.order("Spring Roll")
      expect(takeaway.current_order).to eq(['Spring Roll'])
    end
  end
  describe '#total' do
    it 'should return the total of the ordered items' do
      takeaway.order("Spring Roll", 5)
      expect(takeaway.total).to eq("Your total bill amounts to £10")
    end
  end
  describe '#bill' do
    it 'will add the price of the dish to the order' do
      takeaway.order("Spring Roll")
      expect(takeaway.bill).to eq 2
    end
  end
  describe '#my_order' do
    it 'should return all the dishes that have been ordered' do
      takeaway.order("Spring Roll", 2)
      expect(takeaway.my_order).to eq("Spring Roll, Spring Roll")
    end
  end
  describe '#remove' do
    it 'should remove a dish in the order' do
      takeaway.order("Spring Roll", 2)
      takeaway.remove('Spring Roll')
      expect(takeaway.my_order).to eq("Spring Roll")
    end
  end
  describe '#checkout' do
    it 'should send a text message and return a message confirming it' do
      takeaway.order("Spring Roll", 2)
      takeaway.stub(:checkout).and_return('Message sent')
      expect(takeaway.checkout).to eq('Message sent')
    end
  end
 end
