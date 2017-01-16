require 'customer'

describe Customer do
  subject(:customer){ described_class.new }
  let(:order){ double(:order) }
  before :each do
    Menu.send(:remove_const, "FILENAME")
    Menu::FILENAME = "./lib/list_dishes_test.csv"
  end

  describe '#look_menu' do
    it 'check if want to order something' do
      expect(customer).to respond_to(:look_menu)
    end

    it 'tests printer' do
      expect(customer.look_menu.length).to eq(8)
    end
  end

  describe '#choose_dishes' do
    it {is_expected.to respond_to(:choose_dishes).with(2).argument}

    it 'choose dishes and quantities' do
      dishes = [ ["Supa Minestrone", 3],
                  ["Margherita", 3],
                  ["Pepperoni", 4]
                ]
      estimated_amount = 10
      customer.choose_dishes(dishes, estimated_amount)
      expect(customer.pre_order).to eq(dishes)
    end
  end

  describe '#calculate_amount' do

    it {is_expected.to respond_to(:calculate_amount)}

    it 'calculates an amount' do
      dishes = [ ["Supa Minestrone", 3],
                  ["Margherita", 3],
                  ["Pepperoni", 4]
                ]
      estimated_amount = 10
      customer.choose_dishes(dishes, estimated_amount)
      expect(customer.calculate_amount).to eq(10)
    end
  end

  describe '#place_order' do
    it {is_expected.to respond_to(:place_order)}

    it 'creates a new order' do
      dishes = [ ["Supa Minestrone", 3],
                  ["Margherita", 3],
                  ["Pepperoni", 4]
                ]
      estimated_amount = 10
      customer.choose_dishes(dishes, estimated_amount)
      customer.calculate_amount
      allow(customer).to receive(:amount_check?).and_return(true)
      expect{ customer.place_order }.not_to raise_error
    end

    it 'raise error if total is incorrect' do
      allow(customer).to receive(:amount_check?).and_return(false)
      expect{ customer.place_order }.to raise_error("Incorrect sum")
    end
  end

  describe '#verify_order' do
    it {is_expected.to respond_to(:verify_order)}

    it 'check if the total amount is well calculated' do
      dishes = [ ["Supa Minestrone", 3],
                 ["Margherita", 3],
                 ["Pepperoni", 4]
                ]
      estimated_amount = 10
      customer.choose_dishes(dishes, estimated_amount)
      customer.calculate_amount
      total = 0
      customer.verify_order.each do |(dish, amount)|
        total += amount
      end
      expect(total).to eq(10)
    end

    describe '#verify_order' do
      it {is_expected.to respond_to(:verify_order)}
    end
  end
end
