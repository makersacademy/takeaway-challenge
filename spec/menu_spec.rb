require 'menu'

describe Menu do

  it { is_expected.to respond_to :show_dishes }
  
  it 'shows dishes' do
    expect(subject.show_dishes).to eq 'Noodles: £3.00, Rice: £2.50'
  end

  it 	
end