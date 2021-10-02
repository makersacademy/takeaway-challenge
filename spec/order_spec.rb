require './lib/order'

describe Order do
  describe '#add_menu' do
    it 'adds a menu' do
      m1 = 
      {
      "Chicken Korma"=>8.99,
      "Pilau Rice"=>2.99,
      "Peshwari Naan"=>1.99,
      "4 Poppadoms"=>1.99,
      "Stella Artois"=>3.99
      }
      subject.add_menu(m1)
      expect(subject.menu).to eq (
        {
        "Chicken Korma"=>8.99,
        "Pilau Rice"=>2.99,
        "Peshwari Naan"=>1.99,
        "4 Poppadoms"=>1.99,
        "Stella Artois"=>3.99
        }
      )
    end
  end
  describe '#add_dish' do
    it 'adds a dish from the menu to the order' do
      d1 = double('dish')
      allow(d1).to receive_messages( :name => "Chicken Korma", :price =>  8.99 )
      subject.add_dish(d1)
      expect(subject.contents).to eq (
        {"Chicken Korma"=>8.99}
      )
    end
  end
  describe '#total' do
    it 'shows the current total cost of dishes in order' do
      d1 = double('dish')
      allow(d1).to receive_messages( :name => "Chicken Korma", :price =>  8.99 )
      d2 = double('dish')
      allow(d2). to receive_messages( :name => "Pilau Rice", :price => 2.99 )
      subject.add_dish(d1)
      subject.add_dish(d2)
      expect(subject.total).to eq 11.98
    end
  end
end
