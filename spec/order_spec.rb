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
		subject.add_items("bruschetta", 1, 5)
		expect(subject.basket).to eq([{ dish: "bruschetta", quantity: 1, price: 5 }])
	end

	it "shows the status of the basket" do
		subject.add_items("bruschetta", 1, 5 )
		subject.add_items("pizza salami", 1, 10 )
		expect{subject.view_order}.to output("1. bruschetta : £5\n" +
			"2. pizza salami : £10\n").to_stdout
	end

	it "checks if the price given is correct" do
		subject.add_items("bruschetta", 1, 5 )
		expect { subject.place_order(10) }.to raise_error("The total price is not correct!")

	end
end