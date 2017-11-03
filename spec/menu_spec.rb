require 'menu'

describe Menu do

  let(:menu) do
    menu = []
    CSV.foreach("menu.csv") do |row|
      name, price = row
      menu << { name: name, price: price.to_i }
    end
    menu
  end

  describe '#menu' do
    it 'gets the menu from csv file' do
      expect(subject.menu).to eq menu
    end
  end
  
end
