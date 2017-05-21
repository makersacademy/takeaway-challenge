require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new(menu:menu)}

  let(:menu) { double(:menu) }
  it "prints menu" do
    expect(takeaway.print_menu).to eq ("Chips: 1.50")
  end
end
