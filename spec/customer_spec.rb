require 'customer'

describe Customer do

  let (:menu)       { double :menu }
  let (:cart)       { double :cart }
  let (:customer)   { Customer.new(menu, cart) }

  describe '#view_menu' do
    it 'responds to the instruction to view menu' do
      expect(customer).to respond_to :view_menu
    end

    it 'reads a list of dishes' do
      allow(menu).to receive(:print).and_return('the menu items')
      expect(customer.view_menu).to eq 'the menu items'
    end
  end

  describe '#select_dishes' do
    it 'responds to select_dishes' do
      expect(customer).to respond_to :select_dishes
    end
  end

  describe '#view_total' do
    it 'responds to view_total' do
      expect(customer).to respond_to :view_total
    end
  end

  describe '#review_cart_contents' do
    it 'reveals the contents of the cart' do
      allow(cart).to receive(:format_contents) { print 'formatted contents' }
      expect{customer.review_cart_contents}.to output('formatted contents').to_stdout
    end
  end
end
