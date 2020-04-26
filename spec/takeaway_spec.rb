require 'takeaway'

RSpec.describe Takeaway do 

  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print_dishes: printed_menu) }
  let(:printed_menu) { double("Pizza £5.50, Fish £6.75")}

  it 'has a list of dishes and prices' do 
    expect(menu.print_dishes).to eq printed_menu
  end

end