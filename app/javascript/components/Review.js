import React from 'react';

const Review = (props) => {
  let starComponent = [];

  if (props.rating >= 1) {
    const reviewAverageFraction =  props.rating - Math.trunc(props.rating);

    for (let i = 0; i < props.rating; i++) {
      starComponent.push(<i key={props.museumId.toString().concat(props.id.toString().concat(i.toString()))} className="fas fa-star"></i>);
    }

    if (reviewAverageFraction >= 0.5){
      starComponent.push(<i key={props.museumId.toString().concat(props.id.toString().concat((starComponent.length).toString()))} className="fas fa-star-half"></i>)
    }
  }
  else if (props.rating >= 0.5) {
    starComponent.push(<i key={props.museumId.toString().concat(props.id.toString().concat((starComponent.length).toString()))} className="fas fa-star-half"></i>)
  }

  return(
    <div>
      <p>Review by: {props.user}</p>
      <p>Rating: {starComponent}</p>
      <p>{props.text}</p>
    </div>
  )
}

export default Review;
