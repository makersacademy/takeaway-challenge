require 'menu'

describe Menu do

  it { is_expected.to respond_to :show_dishes }
  
  it 'shows dishes' do
    expect(subject.show_dishes).to eq 'Noodles'
  end
end