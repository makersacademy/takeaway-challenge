require 'takeaway'

RSpec.describe Takeaway do
  subject (:takeaway) { described_class.new(menu) }
  let (:menu) { double :menu, print_menu: 'formatted_menu', items: 'hotpot 20' }
  
  it 'has a menu' do
    expect(takeaway.view_menu).to eq menu.print_menu
  end
end