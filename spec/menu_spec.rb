require 'menu'

describe Menu do
  describe '#show' do
    it 'should show a menu' do
      expect { subject.show }.to output("Shoryu Ganso Tonkotsu          £9.50
Kotteri Hakata Tonkotsu        £9.90
Dracula Tonkotsu               £9.90
Piri Piri Tonkotsu             £9.90
Karaka Tan Tan Tonkotsu        £9.90
Origin Tonkotsu                £9.90
Kimchi Seafood Tonkotsu       £12.90
Curry Ramen                    £9.90\n\n").to_stdout
    end
  end
end
