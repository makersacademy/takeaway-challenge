require 'spec_helper'

describe Shop do

	let(:shop) {described_class.new}
	let(:item) {double(:item)}
	let(:description) {double(:description)}
	let(:price) {double(:price)} 


	describe '#view' do

		it 'shows the menu' do
			shop.view_menu
			expect(shop.menu).to include("Kapa", "Maki", "Salmon")
		end
	end

end
