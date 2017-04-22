require 'menu_printer'

describe MenuPrinter do

  let(:menu) { [{ 'Test' => 1.50 }, { "Test" => 1.5 }] }
  let(:order) { [{ "Test" => 1.5 }, { "Test" => 1.5 }, { "Test" => 1.5 }] }

  it 'prints menu items nicely' do
    printer = described_class.new(menu)
    expect(printer.printed_menu).to eq ["1. Test (£1.50)", "2. Test (£1.50)"]
  end

end
