require './lib/order.rb'

describe Verify do
let(:order) {double :order}
    it {is_expected.to(respond_to(:send_message))}


end
