import Museum from '../../app/javascript/components/Museum';

describe('Museum', () => {
  let wrapper;

  beforeEach(() => {
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

  it('receives the correct props', () => {
    expect(wrapper.find(Museum).props()).toEqual({name: "Boston Children's Museum"})
  });

  it('renders an "li" tag', () => {
    expect(wrapper.find('li')).toBePresent()
  })
});
