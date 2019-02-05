# frozen_string_literal: true

require 'print_outs'

describe PrintOut do
  subject(:print_out) { described_class.new }

  describe '#empty' do
    it 'prints the empty basket message' do
      expect { print_out.empty }.to output(
        "There's nothing in your basket.\n"
      ).to_stdout
    end
  end

  describe '#oops' do
    it 'prints the mistake message' do
      expect { print_out.oops }.to output(
        "Did you make a mistake?\n" \
        "(type 'cancel' to start over)\n"
      ).to_stdout
    end
  end

  describe '#you_entered_zero' do
    it 'prints the zero entered message' do
      expect { print_out.you_entered_zero }.to output(
        "You cannot add 0 items to an order.\n"
      ).to_stdout
    end
  end
end
