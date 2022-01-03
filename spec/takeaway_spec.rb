require 'takeaway'
describe Takeaway do
    let(:takeaway) {Takeaway.new}

    it {is_expected.to respond_to(:menu)}
end