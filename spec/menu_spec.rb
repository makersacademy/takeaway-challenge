require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it "can list items with prices" do
    expect(menu.display).to eq(menu.items)
  end

end
