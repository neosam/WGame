
define('PersonSpec', 'Person', function(Person) {
  return describe('Person', function() {
    var person;
    person = null;
    beforeEach(function() {
      return person = new Person('Max', 30);
    });
    return it('should exist', function() {
      return expect(person.name).notToBeNull();
    });
  });
});
