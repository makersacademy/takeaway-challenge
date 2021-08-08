require "takeaway"

describe Menu do

  subject(:menu) { described_class.new }
  let(:dishes) { {
    'Chicken Shish' => 12,
    'Adana' => 12,
    'Lamb Shish' => 12,
    'Chips' => 3,
    'Grilled Halloumi' => 4
  } 
  }
  
  describe '#list_dishes' do
    it 'should have a list of available dishes' do
      expect(subject.dishes).to eq dishes
    end
  end
end
