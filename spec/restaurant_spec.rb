require 'restaurant'

describe Restaurant do

  let(:subject) { Restaurant.new }
  
  it 'initializes with a menu variable' do
    expect(subject).to respond_to :menu
  end

  it 'initializes with a nil order variable' do
    expect(subject.order).to eq nil
  end

  it 'responds to #place_order' do
    expect(subject).to respond_to :place_order
  end

  it 'creates a new order object using #place_order' do
    subject.place_order
    expect(subject.order).to be_a(Order)
  end

end
