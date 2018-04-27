import Genre from '../../app/javascript/components/Genre';

describe('Genre', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <Genre
        name = "Arts"
      />
    );
  });

//  new test
  it('should render the Genre component', () => {
    expect(wrapper.find(Genre)).toBePresent();
  });

  it('receives the correct props', () => {
    expect(wrapper.find(Genre).props()).toEqual({name: "Arts"})
  });
});
