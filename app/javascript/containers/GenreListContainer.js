import React, { Component } from "react";
import { Link } from 'react-router';

class GenreListContainer extends Component {
  constructor(props) {
    super(props);
    this.state = { genres: [] };
    this.getGenres = this.getGenres.bind(this);
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

  render() {
    let genreComponents = this.state.genres.map((genre) => {
      return (
        <li key={genre.id}>
          <Link to={`genres/${genre.id}`}>{ genre.name }</Link>
        </li>
          );
    });

    return (
      <div id="genre-list">
        <h1>Genres</h1>
        <ul>
          { genreComponents }
        </ul>
      </div>
    );
  }
}

export default GenreListContainer;
