require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it { is_expected.to respond_to(:print) }

  describe "print_menu" do
    it "prints a menu" do
      expect { menu.print }.to output("1. Edamame £3.95\n2. Miso Soup £4.95\n3. Sake Sashimi £7.95\n4. Toro Sashimi £8.95\n5. Salmon and Avocado Roll £9.95\n6. Spicy Tuna Roll £11.95\n7. Toro Dragon Roll £14.95\n").to_stdout
    end
  end
end
