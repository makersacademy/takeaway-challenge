require 'list'

describe List do
  subject(:list) { described_class.new }

  describe '#view_items' do
    before(:context) { File.open("test_list.csv", "w") {|file| file.puts "Margherita, 6"} }

    it 'resets menu items' do
      expect(list).to receive(:reset_menu_items)
      list.view_items("test_list.csv")
    end

    it 'builds menu items' do
      expect(list).to receive(:build_menu_item).at_least(:once)
      list.view_items("test_list.csv")
    end

    it 'prints menu items' do
      expect(list).to receive(:print_menu)
      list.view_items("test_list.csv")
    end

    specify { expect { list.view_items("test_list.csv") }.to output(/Margherita/).to_stdout }
    specify { expect { list.view_items("test_list.csv") }.to output(/6/).to_stdout }

    after(:context) { File.delete("test_list.csv") }
  end

  it {is_expected.to respond_to(:select_items)}
  describe '#select_items' do
    before(:context) do
      File.open("test_list.csv", "w") do |file|
        file.puts "Margherita, 6"
        file.puts "Trois Fromages, 8"
      end
    end
  end


end
