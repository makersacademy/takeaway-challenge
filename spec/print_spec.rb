require 'print'

describe Print do
  let(:menu) { double(:menu) }
  let(:order) { double(:order) }
  it 'display menu' do
    allow(menu).to receive(:menu_content) { { "1" => { "dish" => "Roasted pork", "price" => "8" } } }
    menu_list = menu.menu_content
    expect(subject.display_menu menu_list).to eq("1. Roasted pork - £8")
  end

  it 'display order' do
    allow(order).to receive(:place_order).with(2).and_return({ "Ricotta & mussrooms" => 6 })
    order_list = order.place_order 2
    expect(subject.display_order order_list).to eq("2. Ricotta & mussrooms - £6")
  end
end
