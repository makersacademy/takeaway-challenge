require './lib/basket.rb'

describe Basket do
  let(:item) { double(:item) }
  let(:formatter) { double(:formatter, show_table: "") }
  subject { Basket.new(formatter) }

  describe '.items' do
    context 'method call' do
      specify {
        expect(subject).to respond_to(:items)
      }
    end

    context 'starts empty' do
      specify {
        expect(subject.items.length).to eq(0)
      }
    end
  end

  describe '.add_item' do
    context 'method call' do
      specify {
        expect(subject).to respond_to(:add_item)
      }
    end

    context 'adds to basket array' do
      specify {
        subject.add_item(item)
        expect(subject.items.length).to eq(1)
      }
    end

    context 'adds multiple to basket array' do
      specify {
        (0..4).each do
          subject.add_item(item)
        end
        expect(subject.items.length).to eq(5)
      }
    end
  end

  describe '.remove_item' do
    context 'method call' do
      specify {
        expect(subject).to respond_to(:remove_item)
      }
    end

    context 'removes at index' do
      specify {
        subject.add_item(item)
        subject.add_item("item")
        subject.add_item(item)
        subject.remove_item(1)
        expect(subject.items.include?("item")).to eq(false)
      }
    end
  end

  describe '.basket_total' do
    context 'method call' do
      specify {
        expect(subject).to respond_to(:basket_total)
      }
    end

    context 'starts as 0' do
      specify {
        expect(subject.basket_total).to eq(0)
      }
    end

    context 'accurate price' do
      specify {
        subject.add_item({ name: "spam", price: 1 })
        subject.add_item({ name: "maps", price: 2.5 })
        subject.add_item({ name: "sapm", price: 3.5 })
        expect(subject.basket_total).to eq(7)
      }
    end
  end

  describe '.show_basket' do
    context 'uses formatter' do
      specify {
        expect(formatter).to receive(:show_table)
        subject.show_basket
      }
    end

    context 'shows total' do
      specify {
        expect(subject).to receive(:show_total)
        subject.show_basket
      }
    end
  end
end
