require 'takeaway'

describe TakeAway do
  let(:dish1) { double('dish', name: "McNuggets", price: 3.19) }
  let(:dish2) { double('dish', name: "Big Mac", price: 3.19) }
  let(:dish3) { double('dish', name: "Chicken Legend", price: 3.89) }
  let(:menu) { instance_double(Menu, list_of_dishes: [dish1, dish2, dish3]) }
  subject { described_class.new(menu) }

  context '#see_menu' do
    it { is_expected.to respond_to(:see_menu) }
    
    xit 'has a menu that is displayed' do
      subject.see_menu
    end

  end
  
end
