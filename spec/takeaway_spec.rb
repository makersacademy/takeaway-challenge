require 'takeaway'

describe Takeaway do
	subject(:takeaway){described_class.new(menu:menu, order:order)}
	let(:menu){double(:menu, display:display_menu )}
	let(:display_menu){"List of dishes"}
	let(:number_dishes) { {jajangmyun: 1, bibimbap: 2} }
	let(:order) {double(:order)}

	it 'shows a list of dishes with prices' do
		expect(takeaway.display_menu).to eq display_menu
	end

	it 'can order the combination of dishes' do
		#allow(order).to receive(:add)
		expect(takeaway.order_dishes(number_dishes)).to eq("Costs you £27")
	end	
end