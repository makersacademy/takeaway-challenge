require 'order'

describe Order do
  it 'responds to #select_dish with 1 argument' do
    expect(subject).to respond_to(:select_dish).with(1).argument
  end
    # context '#select_dish' do
  #   it { is_expected.to }
  # end
end
