class ListOfDishes

  def initialize(array_of_hashes)
    @list_of_dishes = Hash.new
    merge_function(array_of_hashes)
  end

  def merge_function(array_of_hashes)
    array_of_hashes.each do |dish|
    @list_of_dishes.merge!(dish)
    end
  end

  def print_list
    list_of_dishes.map { |name, price| "#{name} - #{price}" }.join("\n")
  end

  private
  attr_reader :list_of_dishes

end
