require 'ordering'
require 'stringio'

describe Ordering do
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
end
