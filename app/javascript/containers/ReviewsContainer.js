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
        vote_total = {review.vote_total}
        vote_value = {review.vote_value}
      />
    )
  })

  return(
    <div>
      <h3>Reviews:</h3>
      {reviews}
    </div>
  )
}

export default ReviewsContainer;
