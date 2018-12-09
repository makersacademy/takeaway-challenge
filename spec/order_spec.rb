require "order.rb"

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

describe Order do

  let(:order) { Order.new }
  let(:menu) { Menu.new }

  it 'should initialize with empty #list and total of 0' do
    expect(order.cart).to be_empty
  end

  it 'should add items, and accept quantity to the order' do
    expect { order.add(4, 5) }.to change { order.cart.count }.from(0).to(1)
  end

  it 'should accept number of items as second arg which defualts to 1' do
    expect { order.add(1) }.to change { order.cart.count }.from(0).to(1)
  end

  it 'should have default payment_type of card' do
    expect(order.payment_type).to eq("card")
  end

  it 'payment defaults as false' do
    expect(order.payment).to eq(false)
  end

  it 'wont send order to kitchen unless payment = true' do
    expect(order.place).to eq("order not payed for, please use .change_payment_type if paying cash")
  end



  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  context "after adding items to order" do

    before { order.add(4, 5) }

    it 'should provide total for Order' do
      expect(order.total).to eq(20)
    end



    it 'gives estimate for delivery' do
      order.change_payment_type
      expect(order.place).to eq("Thank you! Your order was placed and will be delivered before #{((Time.new.hour)+(1))}:#{(Time.new.min)}")
    end


end
    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as
    # "Thank you! Your order was placed and will be delivered before 18:52"
    # after I have ordered

    context "after order placed" do


  end

end
