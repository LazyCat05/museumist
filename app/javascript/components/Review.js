import React from 'react';

const Review = (props) => {
  return(
    <div>
      <p>Review by: {props.user}</p>
      <p>Rating: {props.rating}</p>
      <p>{props.text}</p>
    </div>
  )
}

export default Review;
