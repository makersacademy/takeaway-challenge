require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new(menu:menu)}

  let(:menu) { double(:menu) }
  it "prints menu" do
    allow(takeaway).to receive(:print_menu) {:menu}
    expect(takeaway.print_menu).to eq :menu
  end
end
