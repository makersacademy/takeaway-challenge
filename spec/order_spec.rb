require "order.rb"

describe Order do

	let (:dish_name) {double :dish_name}

	it "raise error msg if dish not exist on menu" do
		beer = Menu.new
		expect(subject.add_order(beer,1)).to eq "No such dish"
	end



end