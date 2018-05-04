import React, { Component } from "react";
import { Link } from 'react-router';
import SearchApp from '../components/SearchApp';

class GenreListContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      genres: [],
      searchText: '',
      searchResults: []
    };
    this.getGenres = this.getGenres.bind(this);
    this.updateSearchResults = this.updateSearchResults.bind(this);
  }

  getGenres() {
    fetch("/api/v1/genres.json")
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
        this.setState({ genres: body.genres });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    this.getGenres();
  }

  createGenreTile(array) {

    let displayedGenresArray = array.map( (genre) =>{
      return (
        <div className="panel" key={genre.id}>
          <Link to={`genres/${genre.id}`}>{ genre.name }</Link>
        </div>
      )
    })
    return displayedGenresArray
  }

  updateSearchResults(searchText) {
    let tempResults = []
    this.state.genres.forEach((genre) => {
      if (genre.name.toLowerCase().includes(searchText.toLowerCase())) {
        tempResults.push(genre)
      }
    })

    this.setState({
      searchText: searchText,
      searchResults: tempResults
    })
  }

  render() {
    // let genreComponents = this.state.genres.map((genre) => {
    //   return (
    //     <div className="panel" key={genre.id}>
    //       <Link to={`genres/${genre.id}`}>{ genre.name }</Link>
    //     </div>
    //       );
    // });

    let displayedGenres;

    if (this.state.searchText === '') {
      displayedGenres = this.createGenreTile(this.state.genres)
    } else {
      displayedGenres = this.createGenreTile(this.state.searchResults)
    }

    return (
      <div id="genre-list">
        <div>
          <h1>Genres</h1>
        </div>
        <SearchApp
            updateSearchResults={this.updateSearchResults}
          />
        <div id="genre-description">
          <h3>Click on one of the genres to explore the museums</h3>
        </div>
        {displayedGenres}



      </div>
    );
  }
}

export default GenreListContainer;
