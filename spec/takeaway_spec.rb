require 'takeaway'

RSpec.describe Takeaway do
  let(:menu) { { dish: "Burger", price: 12 } }
  it 'shows a list of dishes with prices' do
    expect(subject.see_menu).to include(menu)
  end
end 
