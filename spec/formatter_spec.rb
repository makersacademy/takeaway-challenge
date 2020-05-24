require 'formatter'

describe Formatter do
  subject(:formatter) { Formatter.new }
  let(:dishes) { {"Large Fish Supper" => 7.90, "Small Fish Supper" => 5.50} }

  describe '#format_menu' do
    it 'formats the menu' do
      formatted_menu = ["Large Fish Supper - £7.90", "Small Fish Supper - £5.50"]
      expect(formatter.format_menu(dishes)).to eq(formatted_menu)
    end
  end
end
