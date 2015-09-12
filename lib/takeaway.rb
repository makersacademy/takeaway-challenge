class Takeaway
  def menu
    @menu = { 'Tomato soup' => 5,
              'Steak and chips' => 15,
              'Salmon Stew' => 12,
              'Chicken currey' => 10,
              'Beef casserole' => 18 }
  end
end

takeaway = Takeaway.new

print takeaway.menu
