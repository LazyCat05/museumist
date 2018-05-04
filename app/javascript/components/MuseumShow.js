import React from 'react';
import { Link } from 'react-router';
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
    this.addNewReview = this.addNewReview.bind(this);
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
      this.setState({
        museumInfo: body,
        reviews: body.reviews
      });

    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let errorDiv = <div>{this.state.errorMessage}</div>

    let starComponent = [];

    if (this.state.museumInfo.review_average >= 1) {
      const reviewAverageFraction =  this.state.museumInfo.review_average - Math.trunc(this.state.museumInfo.review_average);

      for (let i = 0; i < this.state.museumInfo.review_average; i++) {
        starComponent.push(<i key={this.state.museumInfo.id.toString().concat(i.toString())} className="fas fa-star"></i>);
      }

      if (reviewAverageFraction >= 0.5){
        starComponent.push(<i key={this.state.museumInfo.id.toString().concat((starComponent.length).toString())} className="fas fa-star-half"></i>)
      }
    }
    else if (this.state.museumInfo.review_average >=0.5) {
      starComponent.push(<i key={this.state.museumInfo.id.toString().concat((starComponent.length).toString())} className="fas fa-star-half"></i>)
    }

    return(
      <div>
        <div><h1>Details of Museum:</h1></div>
        <div className="museum-details-box">
          <div className="panel medium-10 columns medium-centered">
            <h1>{this.state.museumInfo.name}</h1>
            <p>{this.state.museumInfo.location}</p>
            <p>{this.state.museumInfo.description}</p>
            <p>{this.state.museumInfo.founding_date}</p>
            <p>Museum's Average Review Rating: {starComponent}</p>
            <p><a href={this.state.museumInfo.url} target="_blank">{this.state.museumInfo.url}</a></p>
          </div>
        </div>
        <div className="museum-details-box">
          <div className="panel medium-10 columns medium-centered">
            <ReviewsContainer
              reviews = {this.state.reviews}
              museumId = {this.state.museumInfo.id}
            />
          </div>
        </div>


        <div className="small-12 medium-10 columns medium-centered">
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
