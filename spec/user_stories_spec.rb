require 'customer'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe Customer do
  let(:customer)     { Customer.new }
  let(:menu)         { Menu.new }
  let(:cart)         { Cart.new }

  describe '#print' do
    it 'formats and prints a menu item' do
      expect(customer.view_menu).to eq(menu.print)
    end
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes



# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given
# matches the sum of the various dishes in my order

  describe '#view_total' do
    it 'returns the (formatted) total price from the items in the cart' do
      expect{customer.view_total}.to output("Your total: £#{customer.cart.total}\n").to_stdout
    end
  end

  describe '#review_cart_contents' do
    it 'allows the customer to see the contents of the cart and check the total' do
      expect{customer.review_cart_contents}.to output(customer.cart.format_contents).to_stdout
    end
  end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order
# was placed and will be delivered before 18:52" after I have ordered

  describe '#place_order' do
    it "allows customer to place an order and recieve a confirmation text" do
      # customer.select_dishes(1,3)
      # expect(customer).to receive(confirmation_text)
      # customer.place_order
    end
  end

end
