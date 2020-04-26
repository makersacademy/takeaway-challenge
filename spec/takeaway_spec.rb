require 'takeaway'
require 'stringio'

describe Takeaway do
  let(:item) {'Burger'}
  let(:quanity) {1}

  describe '#view_menu' do
    it 'prints a menu' do
      expect(subject.view_menu).to include({ Burger: :£4 })
    end
  end

  describe '#order' do
    let(:input) {StringIO.new('Burger')}
    it 'receives user input to order food' do
      $stdin = input
      expect { subject.order }.to output("What would you like to order?\n").to_stdout
      $stdin = STDIN
    end
  end
end
