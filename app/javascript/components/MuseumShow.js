import React from 'react';
import { Link } from 'react-router';
class MuseumShow extends React.Component {
  constructor(props){
      super(props)
      this.state = {
        museumInfo: {}
      }
}

componentDidMount(){
let museumId = this.props.params.id
fetch(`/api/v1/museums/${museumId}`)
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
  console.log(body)
  this.setState({
    museumInfo: body.museum
  });

})
.catch(error => console.error(`Error in fetch: ${error.message}`));
}

render() {
    return(
        <div>
          <div><h1>Details of Museum:</h1></div>
          <div>
            <h1>{this.state.museumInfo.name}</h1>
            <p>{this.state.museumInfo.location}</p>
            <p>{this.state.museumInfo.description}</p>
            <p>{this.state.museumInfo.founding_date}</p>
            <p><a href={this.state.museumInfo.url} target="_blank">{this.state.museumInfo.url}</a></p>
          </div>
        </div>
      )
    }
}

export default MuseumShow;
