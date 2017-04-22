require 'list'
require 'CSV'

describe List do
  subject(:list) { described_class.new }

  describe '#view_items' do
    let(:csv) { class_double("CSV") }
    before(:context) do
      File.open("test_list.csv", "w") do |file|
        file.puts "Margherita, 6"
        file.puts "Trois Fromages, 8"
      end
    end

    it 'tells CSV to open list' do
      expect(CSV).to receive(:foreach).with("test_list.csv") 
      list.view_items("test_list.csv")
    end

    it 'calls #build_menu_item' do
      expect(list).to receive(:build_menu_item).at_least(:once)
      list.view_items("test_list.csv")
    end

    it 'reads #menu_items' do
      expect(list).to receive(:print_menu_items)
      list.view_items("test_list.csv")
    end

    after(:context) { File.delete("test_list.csv") }
  end

end
