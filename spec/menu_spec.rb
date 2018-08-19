require 'menu'
require 'tempfile'

describe Menu do
  describe '#load_from_csv' do
    it 'takes data from a csv and loads it into an instance variable' do
      csv_file = Tempfile.new('test.csv')
      csv_file.syswrite("number,name,price\n01,potato,3.00")
      stub_const("Menu::DEFAULT_FILENAME", csv_file.path)

      menu_item_double = double
      expect(MenuItem).to receive(:new).with(number: "01", dish: "potato", price: "3.00").and_return(menu_item_double)
      expected_m_items = { "01" => menu_item_double }

      subject.load_from_csv
      expect(subject.m_items).to eq(expected_m_items)
    end
  end
end
