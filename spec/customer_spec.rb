require 'customer'

describe Customer do 

	let(:menu_class) { double(:menu_class, :pizzas => {'some pizza' => 4.50}, :drinks => {'some drink' => 3.50})}

	it 'responds to #show_pizzas by showing pizzas from Menu class' do
		expect(subject.show_pizzas(menu_class)).not_to be_empty #Do this with a class method
	end
	
	it 'responds to #show_menu by showing drinksfrom Menu class' do
		expect(subject.show_drinks(menu_class)).not_to be_empty #Do this with a class method
	end
end