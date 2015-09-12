require 'customer.rb'

describe Customer do

  it 'should respond to view menu' do
    c1 = Customer.new 12345
    expect(c1).to respond_to :view_menu
  end

end