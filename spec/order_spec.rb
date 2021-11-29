require 'order'

describe Order do
  let(:dish_class) { double(:new => dish) }
  let(:dish_price) { rand(1..5) }
  let(:dish_quantity) { rand(1..10) }
  let(:dish_total) { dish_price * dish_quantity }
  let(:dish) { double("dish", :read_name => "dish", :read_price => dish_price, :amount => dish_quantity, :dish_total => dish_total) }
  # let(:dish2) { double("dish2", :read_name => "dish2", :read_price => dish_price, :amount => dish_quantity, :dish_total => dish_total) }
  let(:order) { described_class.new(dish_class) }

  context '#add_dish_to_order' do
    it 'can add a single dish to an order' do
      order.add_dish_to_order(dish_quantity)
      expect(order.order_list.length).to eq(1)
    end
    
    it 'can add multiple dishes to an order' do
      order.add_dish_to_order(dish_quantity)
      order.add_dish_to_order(dish_quantity)
      expect(order.order_list.length).to eq(2)
    end

    it 'can run the update total method' do
      expect(order).to receive(:update_total)
      order.add_dish_to_order(dish_quantity)
    end

    it 'can update the order total' do
      order.add_dish_to_order(dish_quantity)
      expect(order.display_total).to eq(dish_total)
    end  
  end
  
  context '#display' do
    it 'can display an empty order list after initialization' do
      expect(order.display).to be_empty
    end
    
    it 'can dislpay a populated order list' do
      order.add_dish_to_order(dish_quantity)
      expect(order.display.length).to eq(1)
    end
  end

  context '#verify_total' do
    it 'can verify the order total to match the sum of the dishes ordered' do
      order.add_dish_to_order(dish_quantity)
      expect(order.verify_total).to eq(true)
    end
  end

  context '#checkout' do
    it 'can send a message to the user' do
      
    end
  end

end
