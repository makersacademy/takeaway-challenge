# frozen_string_literal: true

require 'print_outs'

describe PrintOut do
  subject(:print_out) { described_class.new }

  describe '#how_many_would_you_like' do
    it 'prints the quantity question' do
      expect { print_out.how_many_would_you_like }.to output(
        "...and how many would you like?\n"
      ).to_stdout
    end
  end

  describe '#welcome_message' do
    it 'prints the welcome message' do
      expect { print_out.welcome_message }.to output(
        "\n      Welcome to Ruby's Ramen!\n" \
        "------------------------------------\n"
      ).to_stdout
    end
  end

  describe '#what_would_you_like' do
    it 'prints the choice message' do
      expect { print_out.what_would_you_like }.to output(
        "What would you like?\n"
      ).to_stdout
    end
  end
end
