const Restaurant = require('./restaurant')

const menu = {
  items: {
    fries: {
      name: 'fries', price: 1.99
    },
    burger: {
      name: 'burger', price: 3.99
    }
  }
}

const orderDouble = {dishes: []}

beforeEach(() => {
  restaurant.clearOrder();
});

const restaurant = new Restaurant("Dishoom", menu, orderDouble)

describe('restaurant', ()=> {
  describe('listMenu', ()=> {
    it('returns a hash object', ()=> {
      expect(typeof(restaurant.listMenu()) == 'object').toBe(true)
    })
  })
  describe('addItem', ()=> {
    it('adds a given item to the current order', () => {
      restaurant.addItem('fries')
      expect(restaurant.currentOrder.dishes.length).toBe(1)
    })
  })
  describe('completeOrder', ()=> {
    it('returns the total price of the current order', ()=>{
      restaurant.addItem('fries')
      expect(typeof(restaurant.completeOrder()) == 'number').toBe(true)
    })
    it('only allows you to get total on a populated order', ()=>{
      expect(restaurant.completeOrder()).toBe('Please add items to your order')
    })
    it('returns the correct price of the current order plus delivery', ()=> {
      restaurant.addItem(menu.items.fries)
      expect(restaurant.completeOrder()).toBe(1.99+2.99)
    })
  })
})