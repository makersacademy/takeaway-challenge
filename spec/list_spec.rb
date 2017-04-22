require 'list'
require 'CSV'

describe List do
  subject(:list) { described_class.new }
  describe '#view_items' do
    let(:csv) { class_double("CSV") }
    before(:example) do
      File.open("test_list.csv", "w") do |file|
        file.puts "Margherita, 6"
        file.puts "Trois Fromages, 8"
      end
    end
    it 'tells CSV to open list' do
      expect(CSV).to receive(:open).with("test_list.csv", "w") 
      list.view_items("test_list.csv")
    end
    after(:example) { File.delete("test_list.csv") }
  end
end
