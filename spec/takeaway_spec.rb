require 'takeaway'

describe Takeaway do
subject(:takeaway) {Takeaway.new(menu: menu)}
let(:menu) { double (:menu), print: example_menu}
let(:example_menu) {{ pizza: 8, ramen: 6} }


  describe '#show_menu' do
    it 'shows the menu with dishes and their prices' do
    expect(subject.print_menu).to eq ({pizza: 8, ramen: 6})
    end 
  end

  describe '#show_total' do
    it 'displays the total cost of the order' do
        subject.add_to_order("Eggs Benedict")
      expect(subject.show_total).not_to eq 0
    end
  end 
end 
