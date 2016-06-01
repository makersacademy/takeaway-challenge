require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu, list: {"test" => '2'}) }

  it 'it has a menu' do
    expect(takeaway.print_menu).to eq "---\ntest: '2'\n"
  end

  it 'allows user to select from menu' do
    expect(takeaway.select).to respond_to(:chars)
  end
end

