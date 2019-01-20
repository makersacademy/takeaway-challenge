class Menu

  def initialize
    @dishes = [
    { name: "Chicpeas Jungle", price: "12,95" },
    { name: "Brocoli Bush", price: "9,95" },
    { name: "Aspargus Forest", price: "11,95" },
    { name: "Lentils Peak", price: "8,95" },
    { name: "Banana Curnicopia", price: "6,95" }
    ]

  end

  def display
    dishes.each_with_index do |dish, index|
      puts "#{index + 1} #{dish[:name].ljust(20)}  £#{dish[:price]}"
    end
  end

  private

  def dishes
    @dishes
  end

end
