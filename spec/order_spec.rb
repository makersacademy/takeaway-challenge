require 'order'

describe Order do
  subject(:order) { described_class.new }

  it "will show a list of dishes" do
    expect(order).to respond_to(:dish)
  end
end
