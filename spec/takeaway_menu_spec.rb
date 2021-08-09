require 'takeaway_menu'

describe Menu do
  
  let(:full_menu) { { 
    "meat feast pizza" => 7.00,
    "pineapple pizza" => 4.00,
    "ham pizza" => 3.00, 
    "bbq chicken pizza" => 8.00,
    "vegetarian pizza" => 6.00, 
    "cheese pizza" => 3.00, 
    "pepperoni pizza" => 10.00, 
    "the works pizza" => 5.00
    } 
  }

  describe '#get_menu shows a full list of available dishes and prices' do
    it 'shows the full menu' do
      expect(subject.menu).to eq(full_menu)
    end
  end

end
