require 'customer'

describe Customer do
  let(:menu) { double :menu }
  let(:restaurant) { double :restaurant }

  before :each do
    allow(restaurant).to receive(:menu)
    allow(restaurant).to receive(:receive_order)
    allow(restaurant).to receive(:calculate_order).and_return(["Lobster", "Lobster", "Caviar", "Caviar"])
  end

  it { is_expected.to respond_to(:view_menu).with(1).argument }
  it { is_expected.to respond_to(:choose_dishes).with(1).argument }

  it 'can choose a number of dishes' do
    subject.view_menu(restaurant)
    subject.choose_dishes("Lobster", "Caviar")
    expect(subject.choose_amount(2, 2)).to eq ["Lobster", "Lobster", "Caviar", "Caviar"]
  end

  it { is_expected.to respond_to(:view_order) }

  it 'can order only one dish' do
    subject.view_menu(restaurant)
    expect(subject.choose_dishes("Lobster")).to eq ["Lobster"]
  end
end