require 'orders'

describe Orders do

  let(:order) { Orders.new }

  it "shows menu with prices" do
    expect { order.view_menu }.to output("Burger & Chips - £7\nDonner Kebab - £8\nMystery Curry - £9\nHoisin Duck Pankcakes - £10\n").to_stdout
  end

end
