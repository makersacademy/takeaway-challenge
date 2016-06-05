require 'takeaway'

describe Takeaway do

	subject(:takeaway) { described_class.new }
	#let(:menu) { double 'menu' }

	describe 'responses' do
    it { is_expected.to respond_to :menu }
    it { is_expected.to respond_to(:order).with(2).arguments }
	end

	describe '#menu' do
		it 'doesn\'t raise an error' do
			expect{takeaway.menu}.to_not raise_error
		end
		it 'returns the menu' do
			allow(takeaway).to receive(:menu).and_return("Pilau Rice, £2.50")
			expect(takeaway.menu).to eq "Pilau Rice, £2.50"
		end
	end

	context 'when ordering' do
		it 'raises an error if the dish isn\'t on the menu' do
			expect{takeaway.order("A string that isn't a food", 2)}.to raise_error("That dish isn't on the menu, please try again.")
		end

		it 'dishes are added to the basket' do
			takeaway.order("Pilau Rice")
			takeaway.order("Pilau Rice")
			expect(takeaway.basket).to eq "2x Pilau Rice, £4.40"
		end
	end




end

