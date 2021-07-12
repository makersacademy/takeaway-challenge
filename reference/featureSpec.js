'use strict';

describe('Feature Test:', function() {
  let plane;
  let airport;

  beforeEach( () => {
    plane = new Plane();
    airport = new Airport();
  });

  it('planes can be instructed to land at an airport', () => {
    plane.land(airport);
    expect(airport.planes()).toContain(plane);
  });

  it('planes can be instructed to takeoff', () => {
    plane.land(airport);
    expect(airport.planes()).toContain(plane);
    plane.takeoff();
    expect(airport.planes()).not.toContain(plane);
  });

  it('prevents takeoff when weather is stormy', () => {
    plane.land(airport);
    spyOn(airport, 'isStormy').and.returnValue(true);
    expect(function(){ plane.takeoff();}).toThrowError('cannot take off during a storm');
    expect(airport.planes()).toContain(plane);
  });

  it('prevents landing when weather is stormy', () => {
    spyOn(airport, 'isStormy').and.returnValue(true);
    expect(function(){ plane.land(airport);}).toThrowError('cannot land during a storm');
    expect(airport.planes()).toEqual([]); 
  });
});
