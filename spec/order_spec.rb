require 'order'

describe Order do
  let(:menu) { double :menu }
  let(:menu_item) { double :menu_item }
  let(:menu_item_name) { double :menu_item_name }
  let(:menu_item_price) { double :menu_item_price }
  let(:menu_item_category) { double :menu_item_category }
  let(:basket) { double :basket }
  let(:contents) { double :contents }
  let(:Twilio) { double :Twilio }
  let(:contact_number) { double :contact_number }

  describe 'initialize' do
    it { is_expected.to respond_to :start_order }
  end

  describe '#start_order' do
  end

  describe '#acquire_details' do
  end

  describe '#show_menu' do
  end

  describe '#show_basket' do
  end

  describe '#add_to_basket' do
  end

  describe '#remove_from_basket' do
  end

  describe '#checkout' do
  end

  describe '#place_order' do
  end

  describe '#confirm_order' do
  end

end
