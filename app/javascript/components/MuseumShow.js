import React from 'react';
import ReviewsContainer from '../containers/ReviewsContainer'
import ReviewForm from '../containers/ReviewForm'

class MuseumShow extends React.Component {
  constructor(props){
      super(props)
      this.state = {
        museumInfo: {},
        reviews: [],
        errorMessage: ''
      }
      this.addNewReview = this.addNewReview.bind(this)

}

addNewReview(formPayload) {
  fetch('/api/v1/reviews.json', {
    credentials: 'same-origin',
    method: 'post',
    headers: { 'Content-Type': 'application/json'},
    body: JSON.stringify(formPayload)
  })
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`, error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(responseReview => {
      if (responseReview['id'] == 'error message') {
        this.setState({ errorMessage: responseReview['body'] })
      } else {
        let newReviews = this.state.reviews.concat(responseReview)
        this.setState({
          reviews: newReviews,
          errorMessage: ''
        })
    }
    })
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
    reviews: body.reviews
  });

})
.catch(error => console.error(`Error in fetch: ${error.message}`));
}

render() {
  let errorDiv = <div>{this.state.errorMessage}</div>
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
        <div>
          {errorDiv}
          <ReviewForm
            museumId = {this.state.museumInfo.id}
            addNewReview = {this.addNewReview}
          />
        </div>
      </div>
      )
    }
}




export default MuseumShow;
