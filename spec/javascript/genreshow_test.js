import GenreShow from '../../app/javascript/components/GenreShow';
import fetchMock from 'fetch-mock'
import { shallow } from 'enzyme'

describe('GenreShow', () => {
  let wrapper;

  beforeEach(() => {
    let response = {
      name: 'Art',
      museum_list: [
      {
        "id": 1,
        "name": "Heritage Museums and Gardens",
        "location": "67 Grove Street, Sandwich, MA 02563",
        "description": "Engaging Exhibit and 100 acres of gardens and nature trails",
        "founding_date": "2010-03-01",
        "url": "https://heritagemuseumsandgardens.org/",
        "created_at": "2018-04-27T20:20:00.454Z",
        "updated_at": "2018-04-27T20:20:00.454Z"
      }]
    }
    fetchMock.get(`/api/v1/genres/1`, {
      status: 200,
      body: response
    });
    wrapper = mount(
      <GenreShow
        params={{id: 1}}
      />
    )
  })

  afterEach(fetchMock.restore)

  it('should render an SpotTile Component', (done) => {
     setTimeout(() => {
       expect(wrapper.find(GenreShow)).toBePresent();
       done()
     }, 0)
   });
})
