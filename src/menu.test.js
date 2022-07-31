const Menu = require('./menu')
const menu = new Menu 

describe('menu', ()=> {
  describe('listItems', ()=> {
    it('returns a hash object', ()=> {
      expect(typeof(menu.listItems()) == 'object').toBe(true)
    })
  })
})