require 'menu'

describe Menu do
  describe '#show_menu' do
    it 'Shows the menu list' do
      list = "1. Pizza = £12\n2. Patatine = £4\n3. CocaCola = £3\n4. Lasagne = £4\n5. Polenta = £3\n"
      expect { subject.show_menu }.to output(list).to_stdout
    end
  end

  describe '#select_dishes' do
    it "Select dishes the user choice" do
      expect { subject.select_dishes(1, 3) }.to output("Patatine(£4)\nLasagne(£4)\n").to_stdout
    end
  end

  describe '#payment_message' do
    it "Check if payment_message puts the correct sum and message" do
      subject.select_dishes(1, 3, 4)
      expect { subject.payment_message }.to output("You have to pay £11\n").to_stdout
    end
  end
end
