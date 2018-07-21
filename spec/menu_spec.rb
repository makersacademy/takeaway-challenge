require 'menu'

describe Menu do
  let(:test_menu) { double(:test_menu)  }
  subject(:menu) { described_class.new  }

  before do
    test_menu.instance_variable_set(:@menu, '1. Cheeseburger - 11.95')
  end

  describe '#print_menu' do
    before do
      allow($stdout).to receive(:write)
    end
    it { is_expected.to respond_to(:print_menu) }
    it "prints out the list of menu items" do
      allow(menu).to receive(:gets).and_return("y\n")
      expect { menu.print_menu }.to output(@menu).to_stdout
      menu.choice
      expect(menu.choice).to eq "y"
    end
  end
  describe '#decision' do
    before do
      allow($stdout).to receive(:write)
    end
    it { is_expected.to respond_to(:decision) }
    it 'raise an error message when user is not interested' do
      allow(menu).to receive(:gets).and_return("n\n")
      expect{menu.decision}.to raise_error("Not interested, we hope to see you soon")
    end
    it 'delegates to the checkout class' do
      allow(menu).to receive(:gets).and_return("y\n")
      expect(menu).to receive(:place_order)
      menu.place_order
    end
  end

end
