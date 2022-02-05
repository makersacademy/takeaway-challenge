require_relative '../lib/takeaway'

describe Takeaway do
  subject(:takeaway){ described_class.new(menu) }
  let(:menu){ double("menu") }

  it "has a menu" do
    expect(takeaway.menu).to eq menu
  end

end
