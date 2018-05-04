import React from 'react';

const VoteIcon = (props) => {
  return(
    <i onClick={props.ifClicked} className={props.icon} />
  )
}

export default VoteIcon;
