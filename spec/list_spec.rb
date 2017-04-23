require 'list'
require 'twilio-ruby'

describe List do

  before(:context) { File.open("test_list.csv", "w") { |file| file.puts "Margherita, 6" } }

  subject(:list) { described_class.new("test_list.csv") }

  it 'loads menu data on initialization' do
    expect_any_instance_of(List).to receive(:load_menu_data_from_csv)
    List.new("test_list.csv")
  end

  describe '#print_menu' do

    it 'prints header' do
      expect(list).to receive(:print_header)
      list.print_menu
    end

    it 'prints menu items' do
      expect(list).to receive(:print_menu_items)
      list.print_menu
    end

    it 'prints footer' do
      expect(list).to receive(:print_footer)
      list.print_menu
    end

    specify { expect { list.print_menu }.to output(/Margherita/).to_stdout }
    specify { expect { list.print_menu }.to output(/6/).to_stdout }

  end

  after(:context) { File.delete("test_list.csv") }

end
