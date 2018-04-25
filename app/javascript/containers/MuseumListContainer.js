import React, { Component } from 'react';

import Museum from "../components/Museum";

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
        console.log(body);
        this.setState({ museums: body.museums });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    console.log("I am inside componentDidMount")
    this.getMuseums();
  }

  render() {
    let museumComponents = this.state.museums.map((museum) => {

      return (
        <Museum 
          key={ museum.id }
          name={ museum.name }
          id={ museum.id }

        />
      );
    });

    return (
      <div id="museum-list">
        <h1>Museums</h1>
        { museumComponents }
      </div>
    );
  }
}

export default MuseumListContainer;
