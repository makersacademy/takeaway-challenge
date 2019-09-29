require 'menu'

describe Menu do

  describe '#all_dishes' do

    it 'should initiate an array of hashes of existing dishes' do
      expect(subject.all_dishes).to include({chicken_korma: 12}, {cajun_pasta: 8}, {duck_chowmein: 9}, {fosters: 2})
    end

  end

end
