#absolutely terrible spec file - still have no clue on mocking
require 'menu'

describe Menu do
  let(:test_menu) { double(:test_menu)  }
  subject(:menu) { described_class.new  }

  describe '#print_menu' do
    before do
      allow($stdout).to receive(:write)
    end

    before do
      test_menu.instance_variable_set(:@menu, '1. Cheeseburger - 11.95')
    end

    it { is_expected.to respond_to(:print_menu) }
    it "prints out the list of menu items" do
      expect { menu.print_menu }.to output(@menu).to_stdout
    end
  end

  describe '#decision' do
    before do
      allow($stdout).to receive(:write)
    end

    it { is_expected.to respond_to(:decision) }
    it 'raise an error message when user is not interested' do
      allow(menu).to receive(:gets).and_return("n\n")
      expect { menu.decision }.to raise_error("User is not interested in ordering")
    end
    it 'allows a user to add items to their order' do
      allow(menu).to receive(:gets).and_return("y\n")
      expect(menu.decision).to eq menu.add_items
    end
  end

  describe '#add_items' do
    let(:message)  { "Item - £price\n"                   }
    before do
      allow($stdout).to receive(:write)
    end

    it { is_expected.to respond_to(:add_items) }
    it 'returns allows a user to add an item' do
      allow(menu).to receive(:gets).and_return("y\n")
      menu.decision
      allow(menu).to receive(:gets).and_return("1\n")
      menu.items.push(message)
      expect(menu.items).to eq [message]
    end
    xit 'delegates to the checkout class' do

    end
  end

end
