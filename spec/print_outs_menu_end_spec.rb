# frozen_string_literal: true

require 'print_outs'

describe PrintOut do
  subject(:print_out) { described_class.new }

  describe '#match_menu_format' do
    it 'creates the text message content' do
      expect(print_out.match_menu_format('two words')).to eq('Two Words')
    end
  end

  describe '#message_content' do
    it 'creates the text message content' do
      expect(print_out.message_content(1, Date.today)).to eq(
        "\n\nRuby's Ramen!\n\n" \
        'Your order total is £1.00.Your order will be delivered by 00:00'
      )
    end
  end

  describe '#what_is_your_mobile_number' do
    it 'prints the mobile number question' do
      allow(print_out).to receive(:wipe)
      expect { print_out.what_is_your_mobile_number }.to output(
        "What is your mobile number?\n(e.g. 01234567890)\n"
      ).to_stdout
    end
  end
end
