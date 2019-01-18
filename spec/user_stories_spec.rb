require 'customer'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe Customer do
  let(:customer) { Customer.new }
  let(:dishes)   { Dishes.new   }

  describe '#view_dishes' do

    it 'reveals a list of dishes with their prices' do

      expect(customer.view_dishes).to eq dishes.list

    end



  end

end
