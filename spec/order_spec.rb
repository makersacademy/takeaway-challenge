require 'order'

describe Order do

  before(:each) do
    @dish1 = double(:dish, name: 'Fried Rice', price: 3.95)
    @dish2 = double(:dish, name: 'Chicken Curry', price: 4.90)
    @order = Order.new
    @menu = double(:menu)
    allow(@menu).to receive(:offer?).with(@dish1).and_return(true)
    allow(@menu).to receive(:offer?).with(@dish2).and_return(true)
  end

  describe "#initialize/new" do
    it 'has a container for ordered dishes when initilized' do
      expect(subject.ordered_dishes).to eq([])
    end

    it 'starts off with order total of 0' do
      expect(subject.order_total).to eq(0)
    end
  end

  describe "#order_total" do
    it 'Calculates the total of an order' do
      @order.add_to_order(@dish1,3,@menu)
      @order.add_to_order(@dish2,2,@menu)
      expect(@order.order_total).to eq(21.65)
    end
  end

  describe "#add_to_order" do
    it 'add dishes of given quantity to the order' do
      @order.add_to_order(@dish1,2,@menu)
      @order.add_to_order(@dish2,3,@menu)
      expect(@order.ordered_dishes).to eq([{dish:@dish1,quantity:2},
        {dish:@dish2,quantity:3}])
    end

    it 'raise error when dish is not offered on menu' do
      dish3 = double(:dish3)
      allow(@menu).to receive(:offer?).with(dish3).and_return(false)
      expect{@order.add_to_order(dish3,2,@menu)}.to raise_error("Not on menu")
    end
  end

  describe "#display_order_on_email" do
    it 'displays information about the order with total cost' do
      @order.add_to_order(@dish1,2,@menu)
      @order.add_to_order(@dish2,4,@menu)
      display = @order.display_order_on_receipt
      expected_display = "                  Order Details\n\nFried Rice @ 3.95"\
        " x 2                     £   7.90\nChicken Curry @ 4.9 x 4           "\
        "        £  19.60\n--------------------------------------------------"\
        "\nTotal                                     £  27.50"
      expect(display).to eq(expected_display)
    end
  end

  describe "#display_order_on_sms" do
    it 'displays a shortened format order information to send on sms' do
      @order.add_to_order(@dish1,2,@menu)
      @order.add_to_order(@dish2,4,@menu)
      display = @order.display_order_on_sms
      expected_display = "OrderDetails\nFriedRice@3.95x2 £ 7.90\nChickenCurry@"\
      "4.9x4 £ 19.60\n-------------------------\nTotal £ 27.50"
      expect(display).to eq(expected_display)
    end
  end

end
