class Takeaway_Restaurant

  attr_reader :list_of_dishes

  def initialize
    @list_of_dishes = {
    chicken_bhuna: 4.25,
    pilau_rice: 2,
    peshwari_naan: 1.75,
    creamy_lentils: 3,
    onion_bhaaji: 2.75
    }
  end

end
