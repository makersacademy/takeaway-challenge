require 'order'

describe Order do
  subject(:order) { described_class.new }

  it { is_expected.to respond_to(:show_menu) }
  it "should show a list of dishes with prices" do
    expect { order.show_menu }.to output(/Menu/).to_stdout
    expect { order.show_menu }.to output(/Margarita £9/).to_stdout
  end
end
