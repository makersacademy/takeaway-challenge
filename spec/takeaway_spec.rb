require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new }
  # let(:menu) {double :menu}
  # let(:order) {double :order}

  it "add selected dishes to array" do
    subject.add_dish("chips")
    expect(subject.order).not_to be_empty
  end
end