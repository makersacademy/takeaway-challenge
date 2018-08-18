require 'order'
require 'tempfile'


describe Menu do
  let(:subject) { described_class.new }

  describe '#load_from_csv' do
    it 'sets the #menu_list from a given csv' do
      filename = Tempfile.new("test.csv")
      filename.syswrite("food1,food2,food3\n£1,£2,£3")
      expect(subject.load_from_csv(filename.path)).to eq(subject.menu_list)
    end
  end

end
