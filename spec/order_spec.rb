require 'spec_helper'

describe Order do
	subject(:order) {described_class.new}
	let(:item_no) {double(:item_no)}
	let(:quantity) {double(:quantity)}

	it 'should store a numbered order and its quantity and store them as a in  an array' do
		order.request
		expect(order.order_array).to match_array([{item_no: item_no, quantity: quantity}])
	end


end