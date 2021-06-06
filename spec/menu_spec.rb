require 'menu'

describe Menu do

  let(:takeaway_menu) { described_class.new(menu) }
  let(:takeaway_menu) { { "Spring roll" => 0.99, "Char sui bun" => 3.99, 
                "Pork dumpling" => 2.99, "Peking duck" => 7.99, 
                "Fu-king fried rice" => 5.99 } 
                      }
  let(:choice) { subject }

  it 'initializes with a hash' do 
    expect(subject.takeaway_menu).to eq takeaway_menu
  end

  context '#display_menu' do
    it 'displays menu' do
      subject.display_menu
      expect(subject.display_menu).to eq takeaway_menu
    end 
  end

  context '#selection' do 
    it 'selection of food' do
      subject.selection("Spring roll")
      expect(subject.selection("Spring roll")).to eq "Spring roll"
    end
  end

  context '#price' do
    it 'allows comparrison of meal prices' do
      subject.price(choice)
      expect(subject.price("Spring roll")).to eq 0.99  
    end
  end
end
