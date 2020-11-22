'use strict'

class Menu{
  constructor(){
    this.total = 0;
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
       }
       console.log(this.order);

}

   totals() {
   let combined = this.choice();
   let array = combined.filter(price => combined[2]);
    let final = array.reduce((a,b) => a + b, 0)
   return final;

   }



  }
