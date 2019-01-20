require 'customer'

describe Customer do

  let (:customer)   { Customer.new(menu) }
  let (:menu)       { double :menu }
  let (:cart)       { double :cart }

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

    # it 'puts the selections into the cart' do
    #   allow(cart).to receive(:contents) {[]}
    #   allow(menu).to receive(:items)
    #   customer.select_dishes(2)
    #   expect(cart.contents).to receive(1)
    # end



  end


end
