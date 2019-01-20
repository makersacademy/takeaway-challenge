require 'takeaway'
require 'menu'

RSpec.describe 'Feature Tests' do
  let(:dishes) { { "Classic Chicken": 8.85, "Chick Chick Boom": 9.45 } }
  let(:menu) { Menu.new(dishes) }
  
  subject(:takeaway) { Takeaway.new(menu) }

  it 'shows a list of dishes with prices' do
    expect(takeaway.print_menu).to eq dishes
  end
end
