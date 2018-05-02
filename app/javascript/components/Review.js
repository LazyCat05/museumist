import React from 'react';

const Review = (props) => {
  return(
    <div>
      <p>Review by: {props.user}</p>
      <i className="fas fa-star"><p>Rating: {props.rating}</p></i>
      <p>{props.text}</p>
    </div>
  )
}

export default Review;
