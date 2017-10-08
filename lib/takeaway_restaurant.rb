class Takeaway_Restaurant

  attr_reader :list_dishes

  def initialize
    @list_dishes = {
    chicken_bhuna: 4.25,
    pilau_rice: 2,
    peshwari_naan: 1.75,
    creamy_lentils: 3,
    onion_bhaaji: 2.75
    }
  end

  # def list_dishes_and_prices(dishes)
  #   dishes.map { |k, v| "#{k}, #{v}" }
  # end

end
