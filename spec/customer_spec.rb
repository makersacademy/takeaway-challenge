require 'customer'

RSpec.describe Customer do
  let(:menu_double) { double }
  let(:subject) { Customer.new(menu_double) }
end 
