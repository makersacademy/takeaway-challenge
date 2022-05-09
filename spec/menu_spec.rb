require 'menu'

describe Menu do
  describe 'initialize' do
    it 'has a menu when initialized' do
      menu = Menu.new
      expect(menu).to be_an_instance_of(Menu)
    end
    
    it 'creates a menu hash' do
      menu = Menu.new
      expect(menu.full_menu).to include({ "1. cheeseburger" => "£5" })
    end
  end
  
  describe '#view_menu' do
    it 'allows the customer to see the full menu' do
      menu = Menu.new
      expect(menu.view_menu).to eq(menu.full_menu)
    end
  end
  
  describe '#choose_dishes' do
    it 'allows the customer to choose dish 1' do
      # menu = Menu.new
      expect(subject.choose_dishes(1)).to eq("You have chosen {\"1. cheeseburger\"=>\"£5\"}, thank you for ordering")
    end
   
    it 'allows the customer to choose dish 2' do
      # menu = Menu.new
      expect(subject.choose_dishes(2)).to eq("You have chosen {\"2. bacon burger\"=>\"£6\"}, thank you for ordering")
    end
   
    it 'allows the customer to choose dish 3' do
      # menu = Menu.new
      expect(subject.choose_dishes(3)).to eq("You have chosen {\"3. veggie burger\"=>\"£6\"}, thank you for ordering")
    end
   
    it 'allows the customer to choose dish 4' do
      # menu = Menu.new
      expect(subject.choose_dishes(4)).to eq("You have chosen {\"4. chips\"=>\"£3\"}, thank you for ordering")
    end
   
    it 'allows the customer to choose dish 5' do
      # menu = Menu.new
      expect(subject.choose_dishes(5)).to eq("You have chosen {\"5. cheesey chips\"=>\"£4\"}, thank you for ordering")
    end
   
    it 'tells user to try again if another number is placed' do
      # menu = Menu.new
      expect { subject.choose_dishes(6) }.to raise_error "Sorry that number is unavailable, please pick again"
    end
  end
  
  describe '#collect_order' do
    it 'puts the chosen dishes into @my_order' do
      subject.choose_dishes(3)
      subject.collect_order
      expect(subject.my_order).to eq([subject.choose_dishes(3)])
    end
  end
  
  describe '#view_order' do
    it 'has array of chosen dishes' do
      expect(subject.view_order).to be_an_instance_of(Array)
    end
  end
 
end
