require 'menu'
require 'order'

describe Order do

	it "takes an instance of menu" do
		expect(subject.menu).to be_an_instance_of(Menu)
	end

	it "initializes an empty basket" do
		expect(subject.basket).to be_empty
	end

	it "initializes a total amount of 0" do
		expect(subject.total).to eq 0
	end

	it "adds items into the basket" do
		subject.add_items(1,1)
		expect(subject.basket).to eq([{ item: 1, dish: :bruschetta, price: 4.99 }])
	end

	it "shows the status of the basket" do
		subject.add_items(1,1)
		subject.add_items(2,1)
		expect{subject.view_order}.to output("1. bruschetta : £4.99\n" +
			"2. pizza_salami : £9.99\n").to_stdout
	end
end