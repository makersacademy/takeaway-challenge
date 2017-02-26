require 'menu'

describe Menu do

  subject(:menu){described_class.new('./lib/menu.csv')}
  let(:restaurant){ Restaurant.new('Lucky Dragon') }

    it 'can read a CSV file' do
      expect(menu).to respond_to(:print).with(0).arguments
    end

    it 'formats a CSV file' do
      expect(menu.format_menu).to be_an_instance_of Array
    end

  # let(:file){double :file}
  # it 'can read a csv file' do
  #   File.stub(:open).and_return(file)
  #
  #   # allow(file).to receive(:open).and_return(file)
  #   expect(restaurant.display_menu(file)).to eq file
  # end

end
