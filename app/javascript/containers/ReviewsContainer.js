import React, { Component } from 'react';
import Review from "../components/Review"

class ReviewsContainer extends React.Component {
  constructor(props){
      super(props)
      this.state = {

      }
}

render() {
  let reviews = this.props.reviews.map(review => {
    return(
      <Review
        key = {review.id}
        text = {review.body}
      />
    )
  })
  console.log(this.props.reviews)
    return(
        <div>
          <h3>Reviews:</h3>
          <div>
            {reviews}
          </div>
        </div>

      )
    }
}

export default ReviewsContainer;
