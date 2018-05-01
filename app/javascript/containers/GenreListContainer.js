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
        <div className="panel" key={genre.id}>
          <Link to={`genres/${genre.id}`}>{ genre.name }</Link>
        </div>
          );
    });

    return (
      <div id="genre-list">

        <h1>Genres</h1>
        <div id="genre-description">
          <h3>Click on one of the genres to explore the museums</h3>
        </div>
        <div className="row" >
          <div className="small-12 medium-4 columns">{genreComponents[0]}</div>
          <div className="small-12 medium-4 columns">{genreComponents[1]}</div>
          <div className="small-12 medium-4 columns">{genreComponents[2]}</div>
        </div>
        <div className="row">
          <div className="small-12 medium-4 columns">{genreComponents[3]}</div>
          <div className="small-12 medium-4 columns">{genreComponents[4]}</div>
          <div className="small-12 medium-4 columns">{genreComponents[5]}</div>
          </div>
      </div>
    );
  }
}

export default GenreListContainer;
