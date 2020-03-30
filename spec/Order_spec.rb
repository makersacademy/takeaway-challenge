require_relative '../lib/Order'

describe Order do
  it 'can print its basket' do
  expect(order.basket).to eq(order.basket)
  end

end

=begin
class ClassB
  def initialize(class_a_instance)
    @instance_of_class_a = class_a_instance
  end

  def method_calls_method
    @instance_of_class_a.method
  end
end
=end
