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

  describe '#item' do
    let(:input) {StringIO.new("Burger")}
    it 'receives user input for item required' do
      $stdin = input
      expect { subject.item }.to output("What would you like to order?\n").to_stdout
      $stdin = STDIN
    end
  end

  describe '#quantity' do
    let(:input) {StringIO.new("1")}
    it 'receives user input for quantity required' do
      $stdin = input
      expect { subject.quantity }.to output("How many would you like?\n").to_stdout
      $stdin = STDIN
    end
  end
end
