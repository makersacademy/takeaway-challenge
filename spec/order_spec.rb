require 'order.rb'

describe Order do

  subject(:order) {described_class.new}

  context ' @basket' do
    let(:customer_order) {"The special,1,Chicago classic,2,Meat & more meat,1,=£73"}

    it 'should allow a new order to be created' do
      expect(order.basket).to be_a_kind_of(Hash)
    end

    it 'should allow the customer to order with string of an order' do
      message = {"The special"=>1, "Chicago classic"=>2, "Meat & more meat"=>1}
      order.place_order(customer_order)
      expect(order.basket).to eq(message)
    end

    it 'should check the qty of items ordered matchs the order total' do
      order.place_order(customer_order)
      expect(order.basket.values.reduce(:+)).to eq(4)
    end

    context '.basket_summary' do
      it 'should return the basket in a readable format' do
        order.place_order(customer_order)
        expect(order.basket_summary).to eq "The special 1 Chicago classic 2 Meat & more meat 1 Total: £73"
      end
    end

    context '@bill_total' do
      it 'should calculate the bill based on the order qty\'s' do
        order.place_order(customer_order)
        expect(order.bill_total).to eq 73
      end
    end

  end

  context ' @order_time' do

  let(:customer_order) {"The special,1,Chicago classic,2,Meat & more meat,1,=£73"}


    it 'expects the order time to be stored in the order' do
      # customer_order = "The special,1,Chicago classic,2,Meat & more meat,1,=4"
      order.place_order(customer_order)
      time = Time.now
      min = "%02d" % time.min
      expect(order.order_time).to eq("#{time.hour}:#{min}")
    end

    it 'expects the order due time to be stored in the order' do
      time = Time.now
      # customer_order = "The special,1,Chicago classic,2,Meat & more meat,1,=4"
      order.place_order(customer_order)
      time += Order::DELIVERY_TIME
      min = "%02d" % time.min
      expect(order.order_due_time).to eq("#{time.hour}:#{min}")
    end

  end

  context ' edge cases' do

    it 'should prevent the customer from adding food not on the menu' do
      food = "The Big Mac"
      message = ("Sorry, #{food} isn't on the menu")
      expect{order.add_food(food)}.to raise_error message
    end

  end

end
