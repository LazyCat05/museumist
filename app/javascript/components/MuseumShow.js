import React from 'react';
import ReviewsContainer from '../containers/ReviewsContainer'

class MuseumShow extends React.Component {
  constructor(props){
      super(props)
      this.state = {
        museumInfo: {},
        reviews: []
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
    museumInfo: body,
    reviews: body.review_list
  });

})
.catch(error => console.error(`Error in fetch: ${error.message}`));
}

render() {
  console.log(this.state.museumInfo)
    return(
        <div>
        <div><h1>Details of Museum:</h1></div>
        <div>
          <h1>{this.state.museumInfo.name}</h1><br/>
          <p>{this.state.museumInfo.location}</p><br/>
          <p>{this.state.museumInfo.description}</p><br/>
          <p>{this.state.museumInfo.founding_date}</p><br/>
          <p>{this.state.museumInfo.url}</p>
        </div>
        <div>
          <ReviewsContainer
            reviews = {this.state.reviews}
          />
        </div>
      </div>
      )
    }
}




export default MuseumShow;
