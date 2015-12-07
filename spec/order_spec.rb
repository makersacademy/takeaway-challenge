require 'order'

describe Order do
  subject(:order) {described_class.new(menu, text)}
  let(:menu) {double(:menu)}
  let(:text) {double(:text)}

  before do
    allow(order).to receive(:text_confirmation)
    allow(menu).to receive(:check_all_dishes_are_on_menu)
    allow(menu).to receive(:calculate_order_total)
  end

  it 'raises error if the customer total does not match the actual total' do
    mes = "Unable to place order: total doesn't match actual total"
    expect{order.place_order(["starter", 1, 666])}.to raise_error mes
  end

  it 'can order multiple dishes' do
    allow(menu).to receive(:calculate_order_total).and_return(25)
    expect{order.place_order(["starter", 1, "mains", 2, 25])}.not_to raise_error
  end


end
