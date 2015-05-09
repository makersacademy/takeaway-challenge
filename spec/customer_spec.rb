require 'customer'

  describe Customer do
    it 'can check the menu' do
      customer = Customer.new
      expect(customer.checks_menu) == true
    end
  end
