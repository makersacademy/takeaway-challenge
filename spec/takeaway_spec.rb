require 'takeaway'

describe TakeAway do
  let(:dish) { double('dish', name: "McNuggets", price: 3.00) }
  let(:menu) { instance_double(Menu, list_of_dishes: [dish1, dish2, dish3]) }

  context '#see_menu' do
    it { is_expected.to respond_to(:see_menu) }
    
    it 'has a menu that can be read' do

    end

  end
  
end
