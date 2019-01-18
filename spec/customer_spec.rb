require 'customer'

describe Customer do

  let(:customer) { Customer.new }

  describe '#view_dishes' do

    it 'responds to the instruction to view dishes' do
      expect(customer).to respond_to :view_dishes
    end

    it 'reads a list of dishes' do
      expect(customer.dishes.list).to_not eq nil
    end

    it 'view_dishes responds with the list of dishes' do

    end 

  end


end
