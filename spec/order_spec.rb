require 'order'

describe Order do
	let(:menu) { double :menu, dishes: [['Food_1', 1], ['Food_2', 2], ['Food_3', 3]]}
	let(:subject) { described_class.new(menu, [[1,2], [2,3]]) }

	before do
		# io_obj = double
		# expect(io_obj)
		# .to receive(:gets)
		# .and_return(io_obj)
		# .twice
		# expect(io_obj)
		# .to receive(:chomp)
		# .and_return('yoo')
	end
	it { should respond_to(:confirm_order) }

	it 'knows what\'s been ordered' do
		expect(subject.order).to eq ["2 x Food_1", "3 x Food_2"]
	end

	it 'knows how much the order costs' do
		expect(subject.total).to eq 8
	end
end
