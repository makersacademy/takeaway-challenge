require 'menu'

describe Menu do
  it 'should contain a list of menu items' do
    expect(subject.items).to include({ name: "Peri Peri Chicken", cost: 8 })
  end
  describe '#view' do
    it 'should provide a list of dishes' do
      message = "--------------------------\nMenu\n--------------------------\n1: Peri Peri Chicken £8\n2: American Hot Pizza £7\n3: Tandori Chicken Wrap £6\n4: Madras Curry £8\n5: Sweet and Sour Duck £9\n6: Beef Burrito £6\n7: Bacon Cheeseburger £6\n8: Katsu Curry £8\n--------------------------\n"
      expect{ subject.view }.to output(message).to_stdout
    end
  end
end
