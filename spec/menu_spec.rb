require 'menu'
require 'csv'

describe Menu do

  subject(:menu) { Menu.new }

  CSV_PATH = File.open(File.dirname(__FILE__) + '/menu.csv')

  context 'Initialization' do
    it 'Loads menu.csv and correctly initializes @menu' do
      dish_list = menu.menu.map { |dish|
        [dish.description, dish.price] }
      csv_file = []
      CSV.foreach(CSV_PATH) { |line|
        csv_file << [line[0], line[1].to_i] }
      expect(dish_list).to eq csv_file
    end
  end

  context 'printing the menu' do
    it 'correctly prints the menu from @menu' do
      message = ["1. Noodles - £6\n"]
      message << "2. More Noodles - £7\n"
      message << "3. Even More Noodles - £8\n"
      message << "4. Noodless Noodles - £1\n"
      expect { menu.show }.to output(message.join).to_stdout
    end
  end

  context 'Retrieves dish info' do
    it 'receives a number and sends corresponding dish from @menu' do
      expect(menu.send_dish(1).description).to eq 'Noodles'
    end

    it 'returns true if a dish is part of the menu array' do
      expect(menu.in_menu?(menu.menu[1])).to eq true
    end

    it 'returns false if a dish is part of the menu array' do
      expect(menu.in_menu?("X")).to eq false
    end
  end

end
