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

  describe '#close' do
    it 'prints the close message' do
      allow(print_out).to receive(:wipe)
      allow(print_out).to receive(:farewell)
      expect { print_out.close }.to output(
        "\n     Ruby's Ramen!\n-----------------------
Thank you for visiting.\nPlease come again soon.\n\n"
      ).to_stdout
    end
  end

  describe '#empty' do
    it 'prints the empty basket message' do
      expect { print_out.empty }.to output(
        "There's nothing in your basket.\n"
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

  describe '#how_many_would_you_like' do
    it 'prints the quantity question' do
      expect { print_out.how_many_would_you_like }.to output(
        "...and how many would you like?\n"
      ).to_stdout
    end
  end

  describe '#match_menu_format' do
    it 'creates the text message content' do
      expect(print_out.match_menu_format("two words")).to eq("Two Words")
    end
  end

  describe '#message_content' do
    it 'creates the text message content' do
      expect(print_out.message_content(1, Date.today)).to eq(
        "\n\nRuby's Ramen!\n
Your order total is £1.00.Your order will be delivered by 00:00"
        )
    end
  end

  describe '#oops' do
    it 'prints the mistake message' do
      expect { print_out.oops }.to output(
        "Did you make a mistake?
(type 'cancel' to start over)\n"
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

  describe '#welcome_message' do
    it 'prints the welcome message' do
      expect { print_out.welcome_message }.to output(
        "\n      Welcome to Ruby's Ramen!
------------------------------------\n"
      ).to_stdout
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

  describe '#what_would_you_like' do
    it 'prints the choice message' do
      expect { print_out.what_would_you_like }.to output(
        "What would you like?\n"
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
