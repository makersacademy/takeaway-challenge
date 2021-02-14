require 'takeaway'

describe TakeAway do
  let(:menu) { double :menu }
  let(:dish) { double :dish }
  let(:phone) { Text.new(phone_number) }
  subject { described_class.new(menu) }

  it 'initializes with a menu' do
    expect(subject.menu).to eq(menu)
  end

  it 'lets the user to select dishes to add to order' do
    expect(subject).to respond_to(:order)
  end

  it 'lets the user check the total order' do
    expect(subject).to respond_to(:view_order)
  end

  it 'the order starts at £0' do
    expect(subject.check_total).to eq(0)
  end

  it 'sends a text message' do
    expect(subject).to respond_to(:complete_order)
  end

end
