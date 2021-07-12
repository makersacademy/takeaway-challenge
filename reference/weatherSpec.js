'use strict';

describe('Weather', () => {
  let weather;
  beforeEach( () => {
    weather = new Weather();
  });

  it('can be stormy sometimes', () => {
    spyOn(Math, 'random').and.returnValue(10);
    expect(weather.isStormy()).toBeTruthy();
  });

  it('is not stormy other times', () => {
    spyOn(Math, 'random').and.returnValue(3);
    expect(weather.isStormy()).toBeFalsy();
  });
});
