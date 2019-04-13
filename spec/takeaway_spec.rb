require 'takeaway'
require 'menu'

describe Takeaway do
  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "item" }

  it {is_expected.to respond_to(:menu)}

  describe '#print_menu' do
    it 'prints a menu when called' do
      expect(subject.print_menu).to eq(printed_menu)
    end
  end
end
