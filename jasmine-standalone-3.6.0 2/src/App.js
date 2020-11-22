'use strict'

class Menu{
  constructor(){
    this.order = [];
    this.items = [
     {"item": "fish and chips", "price": 4.99, "quantity": 0, "totalPrice": 0},
     {"item": "deep fried pizza", "price": 3.99, "quantity": 0, "totalPrice": 0},
     {"item": "battered sausage", "price": 2.99, "quantity": 0, "totalPrice": 0},
     {"item": "battered white pudding", "price": 2.50, "quantity": 0, "totalPrice": 0},
     {"item": "deep fried mars bar", "price": 1.50, "quantity": 0, "totalPrice": 0},
     {"item": "Irn Bru 1.5l bottle", "price": 1.99, "quantity": 0, "totalPrice": 0}
   ];
  }
    increase(item){
      console.log("increase function in action")
      this.items[item]["quantity"] += 1;
      console.log(this.items[item].quantity)
    }

    decrease(item){
      console.log("decrease function in action")
      this.items[item]["quantity"] -= 1;
      console.log(this.items[item].quantity)

    }


     choice(){
       for (var i = 0; i <this.items.length; i++){
         if (this.items[i].quantity > 0){
           let quantity = this.items[i].quantity;
           let food = this.items[i].item;
           let price = this.items[i].price * quantity;
           this.order.push(food, quantity, price);
          }
        }return this.order;
      }

      receipt(){
        let array = [];
        for (var i = 0; i <this.items.length; i++){
          if (this.items[i].quantity > 0){
            let quantity = this.items[i].quantity;
            let food = this.items[i].item;
            let price = this.items[i].price * quantity;
             this.order.push({"food": food, "quantity": quantity, "price": price});
           }

         }   return this.order;


         }





   totals() {
     let array = this.order;
   let prices =[];
    for (var j = 0; j < array.length; j++){
      prices.push(array[j]["price"]);
    }
    let total = 0;
        for (var l = 0; l < prices.length; l++){
                 total += prices[l];
      }
       return total;
  }
//
//   receipt(){
//     let array2 = this.choice();
//     for (var j = 0; j < array2.length; j++){
//       return array2[j] + array2[j+1] + array2[j+2]+'\n';
//       j +=2;
//   }
// }
//}
}
