require 'menu_loader'

describe MenuLoader do
  subject(:menu_loader) {described_class.new}
  let(:filename) {"./support/data.yaml"}
  context 'Load menu data' do
    it {is_expected.to respond_to(:load).with(1).argument }
    it {is_expected.to respond_to(:objects)}

    it 'Raises an error when it cannot find the data file' do
      expect { menu_loader.load("no_file") }.to raise_error Errno::ENOENT
    end

    it 'returns a hash with objects in it if the file is found' do
      menu_loader.load(filename)
      expect(menu_loader.objects).not_to be_empty
    end
  end
end
