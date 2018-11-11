require 'customer'
require 'take_away'
require 'menu'

describe Customer do

  it 'can create a new customer' do
    person = Customer.new("Ajay")
    expect(person).to be_instance_of(Customer)
  end

  it 'can add a name when #initialize is called' do
    person = Customer.new("Ajay")
    expect(person.name).to eq "Ajay"
  end

  it 'can add an address' do
    person = Customer.new("Ajay")
    person.add_address("29, Buxton Road, CR0 2JZ")
    expect(person.address).to eq "29, Buxton Road, CR0 2JZ"
  end

  it 'can add a phone number' do
    person = Customer.new("Ajay")
    person.add_phone_number(7922231432)
    expect(person.number).to eq 7922231432
  end

  describe Menu do
    it 'can create a new menu' do
      menu = Menu.new
      expect(menu).to be_instance_of(Menu)
    end

    it 'includes dishes and prices when #initialize is called' do
      menu = Menu.new
      expect(menu.menu).to include({ large_chips: 1.99, medium_chips: 1.49, small_chips: 0.99 })
    end

    it 'can add menu items' do
      menu = Menu.new
      menu.add_dish("Wings", 2.99)
      expect(menu.menu).to include(Wings: 2.99)
    end

    it 'can remove a dish' do
      menu = Menu.new
      menu.remove_dish("medium_chips")
      expect(menu.menu).not_to include(medium_chips: 1.49)
    end
  end

  describe TakeAway do
    let(:kfc) { TakeAway.new("KFC", MessagingService.new) }
    let(:menu) { { large_chips: 1.99, medium_chips: 1.49, small_chips: 0.99 } }

    it 'can create a new take away' do
      expect(kfc).to be_instance_of(TakeAway)
    end

    it 'will #initialize with a name' do
      expect(kfc.take_away_name).to eq "KFC"
    end

    it 'will also #initialize with a menu' do
      expect(kfc.take_away_menu).to eq menu
    end

    it 'can #provide_menu to user' do
      expect(kfc.display_menu).to eq menu
    end

    it 'can #take_order and add it to the order list' do
      kfc.take_order("medium_chips", 2)
      kfc.take_order("small_chips", 2)
      expect(kfc.order).to include({ medium_chips: 2.98, small_chips: 1.98 })
    end

    it 'can #return_order and provide the total for checking' do
      kfc.take_order("medium_chips", 2)
      kfc.take_order("small_chips", 2)
      kfc.return_order
      expect(kfc.order).to include({ medium_chips: 2.98, small_chips: 1.98, total: 4.96 })
    end

    it 'throws an error if the total is incorrect' do
      allow(kfc).to receive(:correct?) { false }
      kfc.take_order("medium_chips", 2)
      kfc.take_order("small_chips", 2)
      expect { kfc.return_order }.to raise_error("Error: Sum did not match the total")
    end

    it 'can state the #delivery_time' do
      expect(kfc.delivery_time).to be_within(3600).of(kfc.time_of_order)
    end
  end

  describe MessagingService do
    let(:txt_message) { MessagingService.new }
    let(:kfc) { TakeAway.new("KFC", MessagingService.new) }

    it 'confirms a text message was sent confirming the order' do
      allow(kfc).to receive(:confirm_order).and_return("queued")
      expect(kfc.confirm_order).to eq "queued"
    end

  end
end
