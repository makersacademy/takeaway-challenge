require 'menu'

describe Menu do

	subject(:menu)		{ described_class.new }
	let (:items) do 
				{
					"garlic bread" => 2.99,
					"pizza" => 7.99
				}
				end	

	it {is_expected.to respond_to(:print_menu)}

	it 'has a list of menu items' do
		expect(menu.items).to include("garlic bread")
	end

	describe '#print_menu' do
		it 'can display a list of all available dishes' do
			printed = "printed menu"
			expect(menu.print_menu).to eq(items.map{|k,v| "#{k} : £#{v.round(2)}"}.join(",\n"))
		end
	end

end