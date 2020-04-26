require 'takeaway'
require 'stringio'

describe Takeaway do
  let(:items) { "Burger" }
  let(:quantities) { 1 }

  describe '#view_menu' do
    it 'prints a menu' do
      expect(subject.view_menu).to include({ Burger: 4 })
    end
  end

  describe '#items' do
    let(:input) { StringIO.new("Burger") }
    it 'receives user input for item required' do
      $stdin = input
      expect { subject.items }.to output("What item would you like?\n").to_stdout
      $stdin = STDIN
    end
  end

  describe '#quantities' do
    let(:input) { StringIO.new("1") }
    it 'receives user input for quantity required' do
      $stdin = input
      expect { subject.quantities }.to output("How many would you like?\n").to_stdout
      $stdin = STDIN
    end
  end

  describe '#continuing' do
    let(:input) { StringIO.new("Yes") }
    it 'receives user input for continuing order' do
      $stdin = input
      expect { subject.continuing }.to output("Would you like anything else?\n").to_stdout
      $stdin = STDIN
    end
  end

  describe '#order' do
    let(:input) { StringIO.new("Burger\n1\nYes\nChips\n1\nNo\n") }
    it 'receives user input for ordering' do
      $stdin = input
      expect { subject.order }.to output("What item would you like?\nHow many would you like?\nWould you like anything else?\nWhat item would you like?\nHow many would you like?\nWould you like anything else?\n").to_stdout
      $stdin = STDIN
    end
  end

  describe '#check_order' do
    it 'raises error if amount is incorrect' do
      expect { subject.check_order }.to raise_error "Please recheck"
    end
  end
end
