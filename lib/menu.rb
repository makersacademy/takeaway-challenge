require "awesome_print"

class Menu

  def menu
    { "宫爆鸡丁" => 8, "小葱拌豆腐" => 6,
      "燃面" => 7, "饺子" => 7,
      "辣子鸡" => 9, "麻婆豆腐" => 5}
  end

  def print_menu
    ap menu, :indent => -2
  end

end


=begin
def menu
  [{id: 1, name: "gongbaojiding", chinese: "宫爆鸡丁", price: 8, stock: 5, veg: false},
   {id: 2, name: "xiaocongbandoufu", chinese: "小葱拌豆腐", price: 6, stock: 3, veg: true},
   {id: 3, name: "ranmian", chinese: "燃面", price: 7, stock: 6, veg: false},
   {id: 4, name: "jiaozi", chinese: "饺子", price: 7, stock: 25, veg: false},
   {id: 5, name: "laziji", chinese: "辣子鸡", price: 9, stock: 4, veg: false},
   {id: 6, name: "mapodoufu", chinese: "麻婆豆腐", price: 5, stock: 3, veg: true}]
end


=end
