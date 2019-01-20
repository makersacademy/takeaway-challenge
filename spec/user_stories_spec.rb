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

  describe '#select_dishes' do
    it 'selects the dishes that the customer asks for' do
      customer.select_dishes(1,2)
      expect(customer.cart.contents).to eq (menu.items[0,2])
    end
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  describe '#view_total' do
    it 'returns the (formatted) total price from the items in the cart' do
      customer.select_dishes(1,2)
      expect{customer.view_total}.to output("Your total: £#{customer.cart.total}\n").to_stdout
    end
  end

  describe '#review_cart_contents' do
    it 'allows the customer to see the contents of the cart and check the total' do
      customer.select_dishes(1)
      expect{customer.review_cart_contents}.to output(customer.cart.format_contents).to_stdout
    end
  end



  
end
