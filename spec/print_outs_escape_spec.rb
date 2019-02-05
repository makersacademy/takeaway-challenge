# frozen_string_literal: true

require 'print_outs'

describe PrintOut do
  subject(:print_out) { described_class.new }

  describe '#close' do
    it 'prints the close message' do
      allow(print_out).to receive(:wipe)
      allow(print_out).to receive(:farewell)
      expect { print_out.close }.to output(
        "\n     Ruby's Ramen!\n-----------------------\n" \
        "Thank you for visiting.\nPlease come again soon.\n\n"
      ).to_stdout
    end
  end

  describe '#wipe' do
    it 'clears the screen' do
      allow(print_out).to receive(:system)
      print_out.wipe
    end
  end

  describe '#exit' do
    it 'closes the app' do
      allow(print_out).to receive(:exit)
      print_out.farewell
    end
  end
end
