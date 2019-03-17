require 'menu'

RSpec.describe Menu do
  subject(:menu) { described_class.new(list) }

  let(:list)  { double 'List' } 
  let(:dish1) { double 'Dish', name: 'dish1', price: 11 }
  let(:dish2) { double 'Dish', name: 'dish2', price: 20 }

  before do
    allow(list).to receive(:select_dishes).and_return([{:dish=>dish1.name, :price=>dish1.price}, {:dish=>dish2.name, :price=>dish2.price}])
    allow(list).to receive(:total).and_return 31
    allow(list).to receive(:show_selected_dishes)
  end

  describe '#show_dishes' do
    it 'responds to #show_dishes' do
      expect(menu).to respond_to(:show_dishes)
    end
  end

  describe '#select_dishes' do
    it 'selects several dishes' do
      expect(menu).to respond_to(:select_dishes).with(1).argument
    end

    it 'selectes the only 2 available dishes' do
      # menu.select_dishes needs to use list.select_dishes => list.select_dishes has been stubbed
      # testing that menu calls list and gets back a response
      expect(menu.select_dishes([dish1,dish2])).to eq([{:dish=>dish1.name, :price=>dish1.price}, {:dish=>dish2.name, :price=>dish2.price}])
    end
  end

  describe '#total' do
    context "when correct total" do
      it 'returns a total if order is correct' do
        # menu.total calls the total from list with the slected dishes as an argument
        # menu.select_dishes gets the @selected dishes back
        menu.select_dishes([dish1,dish2])
        expect(menu.total).to eq 31
      end
    end

    context "when incorrect total" do
      it 'returns an error' do
        menu.select_dishes([1,2,3,12])
        # stubb check total method to get a false result
        allow(menu).to receive(:check_total).and_return false
        expect { menu.verify_order }.to output("We have made an error\n").to_stdout
        # implement return of error message
      end
    end
  end

  describe '#put_order' do
    it 'sends a message to the user confirming delivery' do
      expected_delivery = (Time.now + 60*30).strftime "%H:%M"
      allow(menu).to receive(:put_order).and_return("Thank you! Your order was placed and will be delivered before #{expected_delivery}")
      expect(menu.put_order).to eq "Thank you! Your order was placed and will be delivered before #{expected_delivery}"
    end
  end
end