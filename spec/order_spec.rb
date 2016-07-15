require 'order'

describe Order do
  menu = {:chicken_tikka => 6.95, :butter_chiken => 6.45,
          :paneer_tikka => 8.45}

  subject(:order) { Order.new }

  it 'shows a list of dishes available with prices' do
    allow(order).to receive(:read_menu) { menu }
    expect(order.show_list).to eq menu
  end
end
