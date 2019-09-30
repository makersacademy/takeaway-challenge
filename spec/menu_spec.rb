require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#view_items' do
    let(:expected_output) {
      ["MENU:",
       "Pizza -- £6",
       "Burger -- £5",
       "Fries -- £3",
       "Milkshake -- £3",
       "Soda -- £1"].join("\n")
    }
    it 'viewing the items should display the full menu and prices' do
      expect { menu.view_items }.to output(expected_output).to_stdout
    end
  end
end

# can make stdout a double instead
# gets should be a double
# let(:stdout) { double :STDOUT}
# expect(stdout).to receive(:gets).and_return("value")
