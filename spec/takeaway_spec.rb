require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double() }
  our_menu = [{ :dish => "Chicken Curry", :price => 6.50 }, { :dish => "Lamb Curry", :price => 7 }]

  it 'can show menu (list of dishes with prices)' do
    allow(takeaway).to receive(:show_menu=)
    message = "Chicken Curry £6.5\nLamb Curry £7\nVegetable Curry £6\n"
    expect{ takeaway.show_menu }.to output(message).to_stdout
  end

end
