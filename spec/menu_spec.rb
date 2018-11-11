require 'menu'

RSpec.describe Menu do
	let(:dishes) { dishes = {
		'Gallo pinto/Fried cheese/meet' => 5.00,
		'Vigoron' => 6.00,
		'Chancho con yuca' => 4.4,
		'Baho' => 8.00,
		'Nacatamal' => 3.5,
		'Tajada con queso' => 2.5 
		}
	}
	# Se crea el dependency injection, es lo mismo de tener menu = Menu.new(dishes) / Dishes se crea como double arriba con los atributos
	subject(:menu) { described_class.new(dishes) }
	it 'Initialize the name of the dish' do
		expect(menu.list).to eq dishes
	end
end