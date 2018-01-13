require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  subject(:takeaway) { described_class.new(menu)}

  it 'should print a take away menu' do
    allow(menu).to receive(:print_menu).and_return menu
    expect(takeaway.show_menu).to eq menu
  end
end
