import GenreListContainer from '../../../app/javascript/containers/GenreListContainer'
import SearchApp from '../../../app/javascript/components/SearchApp'
import fetchMock from 'fetch-mock'
import { shallow } from 'enzyme'

describe('GenreListContainer', () => {
  let wrapper;

  beforeEach(() => {
    let genres = [
      { name: 'Maritime'},
      { name: 'Science'},
      { name: 'Modern'}
    ]

    fetchMock.get('/api/v1/genres.json', {
      status: 200,
      body: genres
    })

  });

  afterEach(fetchMock.restore)

  it('should return true', () => {
    expect(true).toEqual(true);
  });

})
