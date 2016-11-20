require 'basket'

describe Basket do
  let(:dishes) {double :dishes}
  subject(:basket) {described_class.new(dishes)}

end
