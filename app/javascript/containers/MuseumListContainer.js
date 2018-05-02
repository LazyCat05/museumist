import React, { Component } from 'react';

import { Link } from 'react-router';

class MuseumListContainer extends Component {
  constructor(props) {
    super(props);
    this.state = { museums: [] };
    this.getMuseums = this.getMuseums.bind(this);
}


  getMuseums() {
    fetch('/api/v1/museums.json')
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
        this.setState({ museums: body.museums });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    this.getMuseums();
  }

  render() {
    let museumComponents = this.state.museums.map((museum) => {
      return (
        <div className="panel" key={museum.id}>
          <Link to={`museums/${museum.id}`}>{ museum.name }</Link>
        </div>
          );
    });

    return (
      <div id="museum-list">
        <h1>Museums</h1>
        <div className="small-12 medium-8 columns medium-centered">
          { museumComponents }
        </div>
      </div>
    );
  }
}

export default MuseumListContainer;
