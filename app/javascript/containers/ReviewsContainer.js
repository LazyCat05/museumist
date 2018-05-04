import React, { Component } from 'react';
import Review from "../components/Review"

const ReviewsContainer = (props) => {
  let reviews = props.reviews.map(review => {
    return(
      <Review
        key = {review.id}
        id = {review.id}
        rating = {review.rating}
        text = {review.body}
        user = {review.user_name}
        museumId = {props.museumId}
      />
    )
  })

  return(
    <div>
      <h3>Reviews</h3>
      <div className= "small-12 medium-8 columns medium-centered">
        {reviews}
      </div>
    </div>
  )
}

export default ReviewsContainer;
