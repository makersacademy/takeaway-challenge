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

end

