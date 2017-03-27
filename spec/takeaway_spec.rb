require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu: fake_menu, order: fake_order, sms: fake_sms) }
  let(:fake_menu) { double :menu }
  let(:fake_order) { double(:order, total: 7.50) }
  let(:fake_sms) { double :sms }

  before do
    $stdin = StringIO.new("1")
  end

  it 'displays the menu with the available dishes and prices' do
    expect(fake_menu).to receive(:view)
    takeaway.view_menu
  end

  it 'reviews the order' do
    expect(fake_order).to receive(:review)
    takeaway.review
  end

  it 'comfirms the order which delivers a text' do
    expect(fake_sms).to receive(:send)
    takeaway.confirm
  end


end
