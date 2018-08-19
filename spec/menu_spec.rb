require 'menu'
require 'tempfile'

describe Menu do
  describe '#load_from_csv' do
    it 'takes data from a csv and loads it into an instance variable' do
      csv_file = Tempfile.new('test.csv')
      csv_file.syswrite("number,dish,price\n01,potato,3.00")
      stub_const("Menu::DEFAULT_FILENAME", csv_file.path)

      menu_item_double = double
      expect(MenuItem).to receive(:new).with(number: "01", dish: "potato", price: "3.00").and_return(menu_item_double)
      expected_m_items = { "01" => menu_item_double }

      subject.load_from_csv
      expect(subject.m_items).to eq(expected_m_items)
    end
  end

  describe '#display' do

    it 'prints out a nicely aligned list of number, dish, & price' do
      menu_item_double = double(number: "00", dish: "some food", price: "1.20")
      subject.instance_variable_set(:@m_items, { "00" => menu_item_double })
      expected_string = "00. Some food              £  1.20\n"
      expect{subject.display}.to output(expected_string).to_stdout
    end
  end
end
