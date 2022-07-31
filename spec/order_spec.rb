require 'takeaway'
require 'order'

order = Order.new
describe order do

  it {expect(subject).to be_instance_of(Order)}
end
