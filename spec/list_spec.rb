require 'list'

describe List do
  subject(:list) { described_class.new }

  describe '#view_items' do
    before(:context) { File.open("test_list.csv", "w") {|file| file.puts "Margherita, 6"} }

    it 'resets menu items' do
      expect(list).to receive(:reset_menu_items)
      list.view_items("test_list.csv")
    end

    it 'calls #build_menu_item' do
      expect(list).to receive(:build_menu_item).at_least(:once)
      list.view_items("test_list.csv")
    end

    it 'calls #print_menu' do
      expect(list).to receive(:print_menu)
      list.view_items("test_list.csv")
    end

    specify { expect { list.view_items("test_list.csv") }.to output(/Margherita/).to_stdout }
    specify { expect { list.view_items("test_list.csv") }.to output(/6/).to_stdout }

    after(:context) { File.delete("test_list.csv") }
  end

end
