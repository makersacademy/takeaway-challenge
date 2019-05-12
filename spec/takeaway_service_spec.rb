require 'takeaway_service'

describe TakeawayService do
  subject(:takeaway_service) { described_class.new }

  describe '#view_menu' do
    let(:menu) { double(:menu, view: message) }
    # let(:menu_class) { double(:menu_class, new: menu) }
    let(:message) { "Starters:\nSoup - £3.50\nFritter - £4\nMains:\nChicken - £8.50\nLasagne - £7.50\nDeserts:\nCrumble - £3.50\nIcecream - £3\n" }

    it 'responds to #view_menu' do
      expect(takeaway_service).to respond_to(:view_menu)
    end

    it 'prints a menu to the console' do
      expect { takeaway_service.view_menu }.to output(menu.view).to_stdout
    end
  end

  describe '#add_to_basket' do

    it 'responds to #add_to_basket' do
      expect(takeaway_service).to respond_to(:add_to_basket)
    end

    it "adds a menu item and quantity to the basket" do
      takeaway_service.add_to_basket("Chicken", 2)
      expect(takeaway_service.basket).to eq({ "Chicken" => 2 })
    end

    it 'defaults quantity to 1 if no quantity provided' do
      takeaway_service.add_to_basket("Chicken")
      expect(takeaway_service.basket["Chicken"]).to eq(1)
    end

    it 'can add mulitple dishes to the order' do
      takeaway_service.add_to_basket("Chicken")
      takeaway_service.add_to_basket("Soup")
      expect(takeaway_service.basket).to include("Chicken").and include("Soup")
    end

    it 'can add the same dish more than once, adding the quantities together' do
      takeaway_service.add_to_basket("Chicken", 2)
      takeaway_service.add_to_basket("Chicken", 4)
      expect(takeaway_service.basket["Chicken"]).to eq(6)
    end

    it 'only allows existing menu items to be added to the order' do
      message = "Cannot add to basket: dish not on the menu"
      expect { takeaway_service.add_to_basket("non_existant_dish") }.to raise_error message
    end

    it 'only accepts positive integers above 0 for quantity' do
      message = "Cannot add to basket: quantity not recognised"
      expect { takeaway_service.add_to_basket("Chicken", 0) }.to raise_error message
    end

    it 'returns a message to the user with what they\'ve added to their basket' do
      dish = "Chicken"
      quantity = 2
      order = takeaway_service.add_to_basket(dish, quantity)
      order_message = "2 Chicken(s) added to your basket"
      expect(order).to eq(order_message)
    end
  end

  describe '#order_summary' do

    it 'prints a summary of the order' do
      takeaway_service.add_to_basket("Chicken", 2)
      takeaway_service.add_to_basket("Soup", 2)
      order_summary = "Chicken x2 = £17.0, Soup x2 = £7.0"
      expect { takeaway_service.order_summary }.to output(order_summary).to_stdout
    end
  end

  describe '#order_total' do

    it 'prints the toal cost' do
      takeaway_service.add_to_basket("Chicken", 2)
      takeaway_service.add_to_basket("Soup", 4)
      expect { takeaway_service.total_cost }.to output("£31.0").to_stdout
    end
  end
end
