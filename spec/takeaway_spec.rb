require 'takeaway'
require 'stringio'

describe Takeaway do
  let(:item) { 'Burger' }
  let(:quantity) { 1 }

  describe 'order' do
    it 'defaults to an empty array' do
      expect(subject.order).to be_empty
    end
  end

  describe '#view_menu' do
    it 'prints a menu' do
      expect(subject.view_menu).to include({ Burger: 4 })
    end
  end

  describe '#item' do
    let(:input) { StringIO.new("Burger") }
    it 'receives user input for item required' do
      $stdin = input
      expect { subject.item }.to output("What item would you like?\n").to_stdout
      $stdin = STDIN
    end
  end

  describe '#quantity' do
    let(:input) { StringIO.new("1") }
    it 'receives user input for quantity required' do
      $stdin = input
      expect { subject.quantity }.to output("How many would you like?\n").to_stdout
      $stdin = STDIN
    end
  end

  describe '#continue' do
    let(:input) { StringIO.new("Yes") }
    it 'receives user input for continuing order' do
      $stdin = input
      expect { subject.continue }.to output("Would you like anything else?\n").to_stdout
      $stdin = STDIN
    end
  end
end
