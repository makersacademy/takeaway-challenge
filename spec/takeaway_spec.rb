require 'takeaway'
require 'menu'

describe Takeaway do
  sample_dishes = [{:name => 'Fish', :price => 2.50}, {:name => 'Chips', :price => 1.20}]
  let(:menu) { instance_double("Menu", :view => sample_dishes) }
  let(:subject) { Takeaway.new(menu) }

  it 'displays the menu' do
    expect(subject.view_menu).to eq sample_dishes
  end
end
