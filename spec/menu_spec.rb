require 'menu'

describe Menu do

	describe '#get_dishes' do
		subject(:menu) { Menu.new }
		it {is_expected.to respond_to(:get_dishes)}
		it 'should return array' do
			expect(menu.get_dishes).to be_instance_of(Array)
		end
		it 'should return an array of hashes' do
			menu.get_dishes.each { |dish|
				expect(dish).to be_instance_of(Hash)
			}
		end
	end

	describe '#save_to_csv' do
		subject(:menu) { Menu.new }
		it {is_expected.to respond_to(:save_to_csv).with(1).argument}
		it 'should add something to the csv file' do
			menu.load_from_csv('test_menu.csv')
			menu.save_to_csv('test_menu_save.csv')
			File.read('test_menu_save.csv').should == File.read('test_menu.csv')
		end
	end

	describe '#load_from_csv' do
		subject(:menu) { Menu.new }
		it 'should add an array of hashes to @dishes' do
			before = menu.get_dishes.length
			menu.load_from_csv('test_menu.csv')
			after = menu.get_dishes.length
			expect(before).to be < after
		end
	end

	describe '#set_menus' do
		subject(:menu) { Menu.new }
		it 'should add an array of hashes to @@menus' do
			before = Menu.menus.length
			menu.load_from_csv('test_menu.csv')
			menu.set_menus
			after = Menu.menus.length
			expect(before).to be < after
		end
	end

	def set_dishes(dish)
		expect(Dish).to recieve(:new).and_return({name: 'name', price: 3})
		it 'raises error if not passed a valid Dish object' do
			expect(menu.set_dishes('chicken')).to raise_error ArgumentError, 'Not a valid dish object'
		end
		it 'saves new Dish to @dishes as a correctly formatted hash' do
			menu.set_dishes(Dish.new)
			expect(men.get_dishes.last).to eq({name: 'name', price: 3})
		end
	end

end
