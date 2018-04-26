import Museum from '../../app/javascript/components/Museum';

describe('Museum', () => {
  let name,
      wrapper;

  beforeEach(() => {
    jasmineEnzyme();
    // onClick = jasmine.createSpy('onClick spy');
    wrapper = mount(
      <Museum
        name = "Boston Children's Museum"
      />
    );
  });

//  new test
  it('should render the Museum component', () => {
    expect(wrapper.find(Museum)).toBePresent();
  });
});
