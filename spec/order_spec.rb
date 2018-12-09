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

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  context "after adding items to order" do

    before { order.add(4, 5) }

    it 'should provide total for Order' do
      expect(order.total).to eq(20)

    end

    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered



  end

end
