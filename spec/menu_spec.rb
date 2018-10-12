require "menu"

describe Menu do
  subject(:menu) { described_class.new }

  it "displays the list of items and prices" do
    expect(menu).to respond_to(:view)
  end
end
