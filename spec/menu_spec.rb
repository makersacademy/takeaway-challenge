require 'menu'

describe Menu do
  it 'responds to new' do
    expect(Menu).to respond_to(:new)
  end

  context '#show_list' do
    it 'responds to #show_list' do
      expect(subject).to respond_to(:show_list)
    end

    it 'shows menu_list' do
      expect(subject.show_list).to eq("Costa Del Oval Menu")
    end
  end

  it 'should initialize with a #menu_list' do
    expect(subject.menu_list).to eq("Costa Del Oval Menu")
  end
end
