require 'takeaway'

describe Takeaway do
  let(:dish1_double) { double :dish1, name: "Porridge", price: 1 }
  let(:dish2_double) { double :dish2, name: "Soup", price: 3 }
  let(:dishes_array) { [dish1_double, dish2_double] }
  let(:orders_hash) { { dish1_double => 1, dish2_double => 2 } }
  let(:exact_total) { dish1_double.price * orders_hash[dish1_double] + dish2_double.price * orders_hash[dish2_double] }
  let(:menu_double) { double :menu, add_dish: true, see: dishes_array }
  let(:menu_class_double) { double :menu_class, new: menu_double }
  let(:order_double) { double :order, send_text: true }
  let(:order_class_double) { double :order_class, new: order_double }
  let(:takeaway) { described_class.new(menu_class_double, order_class_double) }

  describe '#new' do
    it 'should be an instance' do
      expect(takeaway).to be_instance_of described_class
    end

    it 'should load the default menu' do
      expect(takeaway.see_menu).to eq "1. #{dish1_double.name}; £#{dish1_double.price}\n2. #{dish2_double.name}; £#{dish2_double.price}"
    end

  end

  describe '#see_menu' do
    it 'should show the menu in list form' do
      expect(takeaway.see_menu).to eq "1. #{dish1_double.name}; £#{dish1_double.price}\n2. #{dish2_double.name}; £#{dish2_double.price}"
    end
  end

  describe '#choose' do
    it 'should return a hash of dish quantities' do
      expect(takeaway.choose).to eq orders_hash
    end
  end

  describe '#check_total' do
    it 'should gets an expected total from the user' do
      expect(takeaway.exact_total).to eq  exact_total
    end
  end

  describe '#create_order' do
    it 'should create order object' do
      expect(takeaway.create_order).to eq order_double
    end
  end

  describe '#place_order' do
    it 'should create order object' do
      takeaway.create_order
      expect(takeaway.place_order).to eq true
    end
  end

end
