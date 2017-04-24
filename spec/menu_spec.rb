require 'menu'

describe Menu do

	describe '#list_dishes' do
		subject(:menu) { Menu.new }
		it {is_expected.to respond_to(:list_dishes)}
		it 'should return array' do
			expect(menu.list_dishes).to be_instance_of(Array)
		end
		it 'should return an array of hashes' do
			menu.list_dishes.each { |dish| 
				expect(dish).to be_instance_of(Hash)
			}
		end
	end

	describe '#save_csv' do
		subject(:menu) { Menu.new }
		it {is_expected.to respond_to(:save_csv).with(1).argument}
		it 'should add something to the csv file' do
			menu.load_csv('test_menu.csv')
			menu.save_csv('test_menu_save.csv')
			File.read('test_menu_save.csv').should == File.read('test_menu.csv')
		end
	end

	describe '#load_csv' do
		subject(:menu) { Menu.new }
		it 'should add an array of hashes to @dishes' do
			before = menu.list_dishes.length
			menu.load_csv('test_menu.csv')
			after = menu.list_dishes.length
			expect(before).to be < after
		end
	end

	describe '#save_menu' do
		subject(:menu) { Menu.new }
		it 'should add an array of hashes to @@menus' do
			before = Menu.menus.length
			menu.load_csv('test_menu.csv')
			menu.save_menu
			after = Menu.menus.length
			expect(before).to be < after
		end
	end

	def add_dish(dish)
		expect(Dish).to recieve(:new).and_return({name: 'name', price: 3})
		it 'raises error if not passed a valid Dish object' do
			expect(menu.add_dish('chicken')).to raise_error ArgumentError, 'Not a valid dish object' 
		end
		it 'saves new Dish to @dishes as a correctly formatted hash' do
			menu.add_dish(Dish.new)
			expect(men.list_dishes.last).to eq({name: 'name', price: 3})
		end
	end

end

