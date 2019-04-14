require 'takeaway'
describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double(:menu, print: "Tacos, £5") }
  it 'prints dishes menu with prices' do
    expect(takeaway.print_menu).to eq("Tacos, £5")
  end
end
