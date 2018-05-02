import React from 'react';

const Review = (props) => {
  let starcomponent = []
  let star = <i className="fas fa-star"></i>
    for (let i = 0; i < props.rating; i++) {
      starcomponent.push(star)
  }

  return(
    <div>
      <p>Review by: {props.user}</p>
      <p>Rating: {starcomponent}</p>
      <p>{props.text}</p>
    </div>
  )
}

export default Review;
