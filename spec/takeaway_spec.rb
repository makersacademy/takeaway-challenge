require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(messager, order, menu) }
  let(:messager) { double :messager }
  let(:order) { double :order }
  let(:basket) { double :basket }
  let(:menu) { double :menu }
  let(:menu_list) { double :menu_list }
  let(:menu_item) { double :menu_item }
  
  describe "#menu" do
    it 'returns the menu' do
      allow(menu).to receive(:all).and_return(menu_list)
      expect(takeaway.menu).to eq menu_list
    end
  end

  describe "#pretty_menu" do
    it "`puts` out the pretty version of the menu" do
      formatted_menu = "some\nstring"
      allow(menu).to receive(:pretty).and_return(formatted_menu)
      expect { takeaway.pretty_menu }.to output(formatted_menu + "\n").to_stdout
    end
  end

  describe "#add_to_order" do
    before do
      allow(menu).to receive(:get).with(1).and_return(menu_item)
      allow(order).to receive(:basket).and_return(basket)
      allow(order).to receive(:add)
    end
    it 'adds a dish to the order in the correct quantity' do
      expect(order).to receive(:add).with(menu_item).twice
      takeaway.add_to_order(1, 2)
    end
    it 'returns the basket' do
      expect(takeaway.add_to_order(1, 2)).to eq(basket)
    end
  end

  describe "#basket" do
    it 'returns the basket' do
      allow(order).to receive(:basket).and_return(basket)
      expect(takeaway.basket).to eq basket
    end
    # it 'is empty when initialised' do
    #   expect(takeaway.basket).to be_empty
    # end

    # context 'after adding some items to an order' do
    #   before do
    #     [[4, 1], [5, 1]].each do |item, quantity|
    #       # takeaway.add_to_order(takeaway.menu[item], quantity)
    #       takeaway.add_to_order(item, quantity)
    #     end
    #     @total = takeaway.basket.map { |item| item[:price] }.sum
    #   end
  
    #   it 'includes my items' do
    #     expect(takeaway.basket).to include(takeaway.menu[4], takeaway.menu[5])
    #   end
    # end
  end

  describe "#confirm" do
    let(:total) { double :total }

    before do
      allow(order).to receive(:total).and_return(total)
    end

    context 'the total is correct' do     
      it 'returns true if the total is correct' do
        allow(messager).to receive(:send)
        expect(takeaway.confirm(total)).to be true
      end

      it 'uses Messager to send a confirmation message' do
        one_hour_from_now = (Time.new + 3600).strftime("%H:%M")
        message = "Thank you! Your order was placed and will be delivered before #{one_hour_from_now}."
        expect(messager).to receive(:send).with(message)
        takeaway.confirm(total)
      end
    end

    context 'the total is incorrect' do
      let(:not_the_total) { double :not_the_total } 

      it 'raises an error if the total is wrong' do
        expect { takeaway.confirm(not_the_total) }.to raise_error "Cannot confirm order: the total was wrong. Check your maths! 😜"
      end
    end
  end
end
