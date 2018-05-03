import React from 'react';

const RatingField = (props) => {
  return (
    <label>{props.label}
      <select
        name={props.name}
        value={props.content}
        onChange={props.handleInput}>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
      </select>
    </label> 
  )
}

export default RatingField;
