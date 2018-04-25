import React from "react";
import { Link } from 'react-router';

const Museum = (props) => {
  return (
    <div>
      <li key={props.id}>
        <Link to={`museum/${props.id}`}>{ props.name }</Link>
      </li>
    </div>
  );
};

export default Museum;
