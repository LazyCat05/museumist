import React from 'react';
import { Link } from 'react-router';

class GenreShow extends React.Component {
  constructor(props){
      super(props)
      this.state = {
        name: "",
        museum_list: []
      }
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

render() {
  let museumComponents = this.state.museum_list.map((museum) => {
    return (
      <li key={museum.id}>
        <Link to={`/museums/${museum.id}`}>{ museum.name }</Link>
      </li>
        );
  });

    return(
      <div id="museum-list">
        <h1> {this.state.name} </h1>
        <ul>
          { museumComponents }
        </ul>
      </div>
      )
    }
}

export default GenreShow;
