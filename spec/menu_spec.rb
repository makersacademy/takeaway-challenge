require 'menu'

describe Menu do

before(:each) do
  subject.add_dish("Tomatoes mozarella",10)
end

  it 'allows to add dishes to the list with name and price' do
    expect(subject).to respond_to(:add_dish).with(2).arguments
  end

  it 'allows to display dishes as a well formatted list' do
    subject.add_dish("Prosciutto",12)
    expect(subject.display_menu).to eq("Tomatoes mozarella: £10, Prosciutto: £12")
    end

  describe '#add_dish' do

    it 'can add dishes' do
    expect(subject.add_dish("Prosciutto",12)).to eq({"Tomatoes mozarella"=>10,"Prosciutto" => 12})
    end
  end

  describe '#remove_dish' do

    it 'can remove dishes' do
    subject.add_dish("Prosciutto",12)
    expect(subject.remove_dish("Prosciutto")).to eq({"Tomatoes mozarella"=>10})
    end
  end


end
