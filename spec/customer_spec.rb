require 'customer'

describe Customer do 

	let(:menu_class) { double(:menu_class, :pizzas => {'some pizza' => 4.50}, :drinks => {'some drink' => 3.50})}

	it 'responds to #show_pizzas by showing pizzas from Menu class' do
		expect(subject.show_pizzas(menu_class)).not_to be_empty #Do this with a class method
	end
	
	it 'responds to #show_menu by showing drinksfrom Menu class' do
		expect(subject.show_drinks(menu_class)).not_to be_empty #Do this with a class method
	end

	it 'can choose a number of several available pizzas' do
		expect(subject.pick_pizza(1, 'some pizza')).to eq ['some pizza']
	end

	it 'registers the prices of the pizzas chosen by the customer' do
		subject.show_pizzas(menu_class)
		subject.pick_pizza(1, 'some pizza')
		expect(subject.pizzas_bill).to eq [4.50]
	end

	it 'can choose a number of several available drinks' do
		expect(subject.pick_drinks(1, 'some drink')).to eq ['some drink']
	end

	it 'registers the prices of the drinks chosen by the customer' do
		subject.show_drinks(menu_class)
		subject.pick_drinks(1, 'some drink')
		expect(subject.drinks_bill).to eq [3.50]
	end

	it 'gives the total charge for the required pizzas and drinks' do
		subject.show_pizzas(menu_class)
		subject.show_drinks(menu_class)
		subject.pick_pizza(1, 'some pizza')
		subject.pick_drinks(1, 'some drink')
		expect(subject.total_charge).to eq 7.50
	end

end