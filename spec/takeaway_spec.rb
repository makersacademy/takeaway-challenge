require 'takeaway'
describe Takeaway do
  subject(:takeaway) { Takeaway.new(menu: menu, order: order) }
  let(:menu) { double(:menu, print: "Tacos, £6" ) }
  let(:order) { double(:order) }
  let(:meals) { { tacos: 6, quesadillas: 5, torta: 4, burrito: 3} }


  it 'prints meals menu with prices' do
    expect(takeaway.print_menu).to eq("Tacos, £6")
  end

  it 'select meals to order' do
     4.times { expect(subject.order).to receive(:add) }
     subject.place_order(meals)
  end
end
