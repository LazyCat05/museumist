describe('Museum', () => {
  let name,
      wrapper;

  beforeEach(() => {
    jasmineEnzyme();
    onClick = jasmine.createSpy('onClick spy'); //<-- this is new
    wrapper = mount(
      <Museum

        name = "Boston Children's Museum"

      />
    );
  });

...
//  new test
  it('should render the Museum component', () => {
    expect(wrapper.find()).toBePresent();
    name = "Boston Children's Museum"
  });
});
