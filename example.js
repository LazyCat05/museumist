import React from 'react';
import { Link } from 'react-router';
import SearchApp from '../components/SearchApp'

class GenreShow extends React.Component {
  constructor(props){
      super(props)
      this.state = {
        name: "",
        museum_list: [],
        searchText: '',
        searchResults: [],
        count: 9
      }
    this.updateSearchResults = this.updateSearchResults.bind(this)
    this.showMoreResults = this.showMoreResults.bind(this)

}


componentDidMount(){
let genreId = this.props.params.id
fetch(`/api/v1/genres/${genreId}`)
.then(response => {

  if (response.ok) {
    return response;
  } else {
    let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage);
    throw(error);
  }
})
.then(response => response.json())
.then(body => {
  this.setState({
    name: body.name,
    museum_list: body.museum_list
  });
})
.catch(error => console.error(`Error in fetch: ${error.message}`));
}

showMoreResults(event) {
    event.preventDefault()

    let newCount = this.state.count + 9
    this.setState({
      count: newCount
    })
  }

  updateSearchResults(searchText) {
    let tempResults = []
    this.state.spots.forEach((spot) => {
      if (spot.name.toLowerCase().includes(searchText.toLowerCase())) {
        tempResults.push(spot)
      }
    })

    let tempCount = this.state.count
    if (searchText.length === 1) {
      tempCount = 9
    }
    this.setState({
      searchText: searchText,
      searchResults: tempResults,
      count: tempCount
    })
  }

render() {
  let museumComponents = this.state.museum_list.map((museum) => {
    return (
      <div className="panel" key={museum.id}>
        <Link to={`/museums/${museum.id}`}>{ museum.name }</Link>
      </div>
        );
  });
  let showMoreButton;
    if (this.state.spots != []) {
      if (displayedSpots.length === this.state.spots.length || displayedSpots.length === this.state.searchResults.length) {
        showMoreButton = <div></div>
      } else {
        showMoreButton = <button onClick={this.showMoreResults}>Show More</button>
      }
    }

    return(
      <div id="museum-list">
        <h1> {this.state.name} </h1>
        <div className="small-12 medium-8 columns medium-centered">
          <ul>
            { museumComponents }
          </ul>
        </div>
        <div>
          <div>
        <div>
          <SearchApp
            updateSearchResults={this.updateSearchResults}
          />
        </div>
        <div className="row spot-container">
          {displayedSpots}
        </div>
        <div>
          {showMoreButton}
        </div>
      </div>

        </div>
      </div>
      )
    }
}


export default GenreShow;
