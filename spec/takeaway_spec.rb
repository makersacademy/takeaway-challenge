require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }
  let(:item) { double(:item) }
  let(:quantity) { double(:quantity) }

  it 'receives a menu object when created' do
    expect(takeaway.menu).not_to be_nil
  end

  it 'prints the menu to the screen' do
    expect{takeaway.show_menu}.to output.to_stdout
  end

  it { is_expected.to respond_to(:items) }

  it { is_expected.to respond_to(:add_item).with(2).arguments }

  it 'adds your chosen item to items' do
    takeaway.add_item(item, quantity)
    expect(takeaway.items.empty?).to eq false
  end

end
