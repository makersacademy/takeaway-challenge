require 'order'
require 'tempfile'

describe Menu do

  describe '#load_from_csv' do
    it 'sets the #menu_list from a given csv' do
      filename = Tempfile.new("test.csv")
      filename.syswrite("foodname,price\ntomatoes,£1\ncucumber,£3")
      subject.load_from_csv(filename.path)

      expected_menu_list = [
        {"foodname" => "tomatoes", "price" => "£1"},
        {"foodname" => "cucumber", "price" => "£3"},
      ]

      expect(subject.menu_list).to eq(expected_menu_list)
    end
  end

end
