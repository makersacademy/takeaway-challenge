require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:order) { double :order }
  subject(:takeaway) { described_class.new(menu, order) }
 
  it 'contains a @menu that is an instance of Menu' do
    ta = described_class.new()
    expect(ta.menu).to be_an_instance_of(Menu)
  end

  describe '#show_menu' do
    it 'shows menu using menu.show_menu' do
      default_return = "SHOULD PRINT THIS"
      allow(menu).to receive(:show_menu).and_return(default_return)
      expect(takeaway.read_menu).to eq(default_return)
    end
  end

  describe '#order_item' do
    menu_item_name = 'Curry'
    menu_item_object = 'MI object with name and price'
    it 'adds new item with default quantity to order basket' do
      basket_hash = {}
      allow(menu).to receive(:find_item).with(menu_item_name).and_return(menu_item_object)
      allow(order).to receive(:basket).and_return(basket_hash)
      takeaway.order_item(menu_item_name)
      expect(basket_hash).to eq({ menu_item_object => 1 })
    end

    it 'adds new item with specific quantity to order basket' do
      basket_hash = {}
      quantity = rand(1..5)
      allow(menu).to receive(:find_item).with(menu_item_name).and_return(menu_item_object)
      allow(order).to receive(:basket).and_return(basket_hash)
      takeaway.order_item(menu_item_name, quantity)
      expect(basket_hash).to eq({ menu_item_object => quantity })
    end

    it 'increases quantity of existing items in order basket' do
      quantity = rand(1..5)
      basket_hash = { menu_item_object => quantity, 'bla' => 1 }
      allow(menu).to receive(:find_item).with(menu_item_name).and_return(menu_item_object)
      allow(order).to receive(:basket).and_return(basket_hash)
      takeaway.order_item(menu_item_name)
      expect(basket_hash).to eq({ menu_item_object => quantity + 1, 'bla' => 1 })
    end

  end

  describe '#show_order_basket' do
    it 'shows all items in the basket of the current order using #order.show_basket' do
      allow(order).to receive(:show_basket).and_return('SHOULD PRINT THIS')
      expect(takeaway.show_order_basket).to eq('SHOULD PRINT THIS')
    end
  end

  describe '#show_order_total' do
    it 'shows the total price of all items in the basket of the current order using #order.calculate_total_price' do
      allow(order).to receive(:calculate_total_price).and_return("SHOULD PRINT THIS")
      expect(takeaway.show_order_total).to eq('SHOULD PRINT THIS')
    end
  end

  describe '#show_order_subtotals' do
    it 'shows the subtotals for each ordered item in the basket of the current order using #order.calculate_subtotals' do
      allow(order).to receive(:calculate_subtotals).and_return("SHOULD PRINT THIS")
      expect(takeaway.show_order_subtotals).to eq('SHOULD PRINT THIS')
    end
  end

end
