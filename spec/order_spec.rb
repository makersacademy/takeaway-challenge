require 'order'
require 'menu'
require 'csv'

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

describe Order do
  let(:order) { Order.new }
  # let(:text) { double :send_text }

  it 'responds to add_item' do
    expect(subject).to respond_to(:add_item).with(2).arguments
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  context ' - it can manage orders, quantities and cost' do

    before do
      subject.add_item("sushi", 3)
      subject.add_item("noodles", 1)
      subject.add_item("edamame", 2)
    end

    it 'adds the selection to the basket' do
      expect(subject.basket).to include ["sushi", 3]
      expect(subject.basket).to include ["noodles", 1]
      expect(subject.basket).to include ["edamame", 2]
    end

    context ' - order is correct' do

      it 'checks for confirmation from the customer' do
        expect(subject.order_confirmation).to eq "Y" or "N"
      end

      it 'calculates the total cost of food' do
        expect(subject.total).to eq 28
      end
    end

    context ' - message sends' do

      it 'includes time of delivery' do
        expect(order).to receive(:send_text)
      end
    end
  end
end
