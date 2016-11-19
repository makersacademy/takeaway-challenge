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

  it 'adds your chosen item to items' do
    takeaway.add_item(item, quantity)
    expect(takeaway.items.empty?).to eq false
  end

end
