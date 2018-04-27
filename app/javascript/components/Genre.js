import React from "react";
import { Link } from 'react-router';

const Genre = (props) => {
  return (
    <div>
      <li key={props.id}>
        <Link to={`genres/${props.id}`}>{ props.name }</Link>
      </li>
    </div>
  );
};

export default Genre;
