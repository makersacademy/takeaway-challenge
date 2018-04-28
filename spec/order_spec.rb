require 'order'

describe Order do

  let(:order) { Order.new }
  let(:menu) { double :menu }

  it 'displays a menu' do
    expect{ order.see_menu }.to output.to_stdout
  end

end
