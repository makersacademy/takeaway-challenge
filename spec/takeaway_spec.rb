require 'takeaway'

describe Takeaway do

  let(:takeaway) { Takeaway.new }

  describe '#show_menu' do
    before do
      allow($stdout).to receive(:write)
    end

    it 'subject shows menu' do
      expect(takeaway).to respond_to(:show_menu)
    end

    it 'shows a list of menu items' do
      expect(takeaway.show_menu).to be_an_instance_of(Array)
    end
  end

  describe "#choose_order" do
    it 'subject shows menu' do
      expect(takeaway).to respond_to(:choose_order)
    end
    it 'adds items to the order list' do
      takeaway.choose_order
      expect(takeaway.order.total_order).not_to be_empty
    end
  end

  describe "#choose_order" do
    it 'subject totals and shows bill' do
      expect(takeaway).to respond_to(:bill)
    end
  end
  describe "#confirm_order" do
    it 'subject confirms order' do
      expect(takeaway).to respond_to(:confirm_order)
    end
  end
end
