require 'formatter'

describe Formatter do
  subject(:formatter) { Formatter.new }
  let(:dishes) { {"Large Fish Supper" => 7.90, "Small Fish Supper" => 5.50} }
  let(:selection) { {"Large Fish Supper" => 2} }

  describe '#format_menu' do
    it 'formats the menu' do
      formatted_menu = ["Large Fish Supper - £7.90", "Small Fish Supper - £5.50"]
      expect(formatter.format_menu(dishes)).to eq(formatted_menu)
    end
  end

  describe '#format_order' do
    it 'formats the order' do
      formatted_order = ["Large Fish Supper x2"]
      expect(formatter.format_order(selection)).to eq(formatted_order)
    end
  end

  describe '#format_total(amount)' do
    it 'formats the total' do
      total = 15.8
      expect(formatter.format_total(total)).to eq("Total: £15.80")
    end
  end
end
