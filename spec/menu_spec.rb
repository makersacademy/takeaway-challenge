require 'menu' 

describe Menu do 
  subject(:menu) { described_class.new }

  let(:dishes) { { 
    'Fried Rice' => 15,
    'Jollof Rice' => 10,
    'Beans and stew' => 7,
    'Yam and Egg' => 7
  }
  }
  describe '#list_dishes' do
    it 'should display the differnt dishes available and their prices' do
      expect(subject.list_dishes).to include('Yam and Egg: £7') 
    end
  end
end
