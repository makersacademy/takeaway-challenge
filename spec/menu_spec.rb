require 'menu'

describe Menu do


  subject(:menu){described_class.new('./lib/menu.csv')}
  let(:restaurant){ Restaurant.new('Lucky Dragon') }

    it 'can read a CSV file' do
      expect(menu).to respond_to(:print).with(0).arguments
    end

    it 'converts the CSV into a readable format for the customer' do
      menu.print
      expect(menu.menu).to be_an_instance_of String
    end

    it 'formats a CSV file for the program' do
      expect(menu.format_menu).to be_an_instance_of Array
    end

end
