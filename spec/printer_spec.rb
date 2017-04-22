require 'printer'

describe Printer do

  let(:menu) { [{ 'Test' => 1.50 }] }

  it 'prints menu items nicely' do
    printer = described_class.new(menu)
    expect(printer.printed_menu).to eq ["1. Test (£1.50)"]
  end
end
