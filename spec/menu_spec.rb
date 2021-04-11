require 'menu'

describe Menu do

  it { is_expected.to be_an_instance_of(Menu) }
  it { is_expected.to respond_to(:menu_list) }
  
  it { is_expected.to respond_to(:availability)}

  it 'sets false to the available? key of the dish' do
    allow(subject).to receive(:rand).and_return(5)
    subject.availability
    expect(subject.menu_list[0][:available?]).to be_falsey
  end
end