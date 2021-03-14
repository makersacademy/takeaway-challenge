require 'user'

describe User do
  let(:mobile) { ENV['USER_MOBILE'] }
  let(:menu) { double(:menu)}
  let(:basket) { double(:basket) }
  let(:order_log) { double(:order_log) }
  let(:user) { described_class.new(mobile, menu, basket, order_log)}

  describe "#view_menu" do
    it 'output menu content to stdout' do
      allow(menu).to receive(:display_menu_in_category).and_return("test menu")
      expect { user.view_menu }.to output("test menu\n").to_stdout
    end
  end

  describe "#add_to_basket" do
    it 'evoke basket.add("test 1)' do
      allow(menu).to receive(:get_item).with("1").and_return("test 1")
      expect(basket).to receive(:add).with("test 1")
      user.add_to_basket("1")
    end
  end

  describe "#delete_from_basket" do
    it 'raise error when basket is empty' do
      allow(basket).to receive(:empty?).and_return(true)
      expect { user.delete_from_basket("1") }.to raise_error("basket is empty")
    end

    it 'evoke basket.delete("test 1")' do
      allow(basket).to receive(:empty?).and_return(false)
      allow(menu).to receive(:get_item).with("1").and_return("test 1")
      expect(basket).to receive(:delete).with("test 1")
      user.delete_from_basket("1")
    end
  end

  describe "#view_basket" do
    it 'output basket content to stdout' do
      allow(basket).to receive(:view).and_return("test basket")
      expect { user.view_basket }.to output("test basket\n").to_stdout
    end
  end

  describe "#check_out" do
    context 'when basket is empty' do
      it 'raise error' do
        allow(basket).to receive(:empty?).and_return(true)
        expect{ user.check_out }.to raise_error("basket is empty")
      end
    end
    context 'when basket is not empty' do
      it 'evoke order_log.add(user, basket)' do
        allow(basket).to receive(:empty?).and_return(false)
        expect(order_log).to receive(:add).with(user,basket)
        user.check_out
      end
    end
  end

  describe "#menu_ids" do
    before(:each) { allow(menu).to receive(:food_menu).and_return([{"id" => 1}, {"id" => 2}]) }
    it 'returns a list of menu id' do
      expect(user.menu_ids).to be_an_instance_of(Array)
    end
    it 'is not empty' do
      expect(user.menu_ids).to_not be_empty
    end
  end

  describe "#basket_item_ids" do
    before(:each) { allow(basket).to receive(:items).and_return([{"item" => {"id" => 1}}, {"item" => {"id" => 2}}]) }
    it 'returns a list of item id' do
      expect(user.basket_item_ids).to eq [1, 2]
    end
  end
end
