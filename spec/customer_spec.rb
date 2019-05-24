require './lib/customer.rb'

describe Customer do
  let(:customer) { Customer.new(order_double_class) }
  let(:order_double_class) { double(:order_double_class, :new => order) }
  let(:order) { double(:order) }

  context '#view_menu' do
    it 'display\'s a list of dishes and their prices' do
      expect(order).to receive(:view_menu)
      customer.view_menu
    end
  end
end
