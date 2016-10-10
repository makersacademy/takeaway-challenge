require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu, dishes: { "burrito"=>7.24, "enchiladas"=>7.43 } }
  let(:messenger) { double :messenger }
  let(:burrito) { double :burrito, keys: ["burrito"] }
  let(:quantity) { 4 }
  subject(:wahaca) { described_class.new(menu, messenger) }

  it 'displays the current menu' do
    expect(wahaca.view_menu).to eq menu.dishes
  end

  it 'raises an error when viewing an empty order' do
    expect {wahaca.view_order}.to raise_error 'Basket empty'
  end

  it 'raises an error when viewing an empty order' do
    expect {wahaca.view_cost}.to raise_error 'Total cost £0: basket empty'
  end

  context 'after adding items to the order' do
    before do
      wahaca.add_to_order("burrito", quantity)
    end

    it 'allows you to view the current order' do
      expect(wahaca.view_order).to eq ["burrito x4 = £28.96"]
    end
  end
end
