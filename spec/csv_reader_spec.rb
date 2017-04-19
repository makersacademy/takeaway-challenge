require 'csv_reader'

describe CsvReader do

  default_file = "#{Dir.pwd}/lib/dishes.csv"

  subject(:csv_reader) { described_class.new(file: default_file) }

  it 'checks that csv file is parsed correctly using example data set' do
    example_menu = {"Chicken Tikka Masala" => 6.45}
    csv_reader_2 = CsvReader.new(file: "#{Dir.pwd}/spec/test_data/dishes.csv")
    expect(csv_reader_2.menu).to eq example_menu
  end

  it 'raises error if file does not exist' do
    expect{ CsvReader.new(file: "") }.to raise_error('File not found')
  end

end
