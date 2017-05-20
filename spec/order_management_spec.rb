require 'order_management'

describe OrderManagement do

  subject(:order_management) { described_class.new }

  it 'should respond to #order_by_commandline' do
    expect(order_management).to respond_to(:order_by_commandline)
  end

end
