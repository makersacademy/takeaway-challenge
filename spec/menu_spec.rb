require "menu"

describe Menu do
  subject(:menu) { described_class.new }

  it "should see a list of dishes with price" do
    expect(menu).to respond_to(:display)
  end
end
