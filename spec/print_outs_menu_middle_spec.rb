# frozen_string_literal: true

require 'print_outs'

describe PrintOut do
  subject(:print_out) { described_class.new }

  describe '#checkout' do
    it 'prints the checkout message' do
      expect { print_out.checkout }.to output(
        "(type 'checkout' to submit order)\n"
      ).to_stdout
    end
  end

  describe '#exit_message' do
    it 'prints the exit to leave message' do
      expect { print_out.exit_message }.to output(
        "'Exit' to leave.\n\n"
      ).to_stdout
    end
  end

  describe '#receipt_header' do
    it 'prints the receipt header' do
      expect { print_out.receipt_header }.to output(
        "             Your Order\n------------------------------------\n"
      ).to_stdout
    end
  end
end
