require 'menu'

describe Menu do


  describe '#initialize' do
    it 'has dishes' do
      expect(subject.list).to eq([{ dish: 'green curry', price: 3.00 },
                                  { dish: 'singapore noodles', price: 4.00 },
                                  { dish: 'salmon teriyaki', price: 5.00 }])
    end
  end

  describe '#view_menu' do
    it 'lets the user view the menu' do
      expect(subject.view_menu).to eq([{ dish: 'green curry', price: 3.00 },
                                  { dish: 'singapore noodles', price: 4.00 },
                                  { dish: 'salmon teriyaki', price: 5.00 }])
    end
  end

end
