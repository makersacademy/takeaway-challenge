require 'list'
require 'twilio-ruby'

describe List do

  before(:context) { File.open("test_list.csv", "w") { |file| file.puts "Margherita, 6" } }

  subject(:list) { described_class.new("test_list.csv") }

  it 'loads menu data on initialization' do
    expect_any_instance_of(List).to receive(:load_menu_data_from_csv)
    List.new("test_list.csv")
  end

  describe '#view_items' do

    it 'prints menu items' do
      expect(list).to receive(:print_menu)
      list.view_items("test_list.csv")
    end

    specify { expect { list.view_items("test_list.csv") }.to output(/Margherita/).to_stdout }
    specify { expect { list.view_items("test_list.csv") }.to output(/6/).to_stdout }

  end

  after(:context) { File.delete("test_list.csv") }

end
