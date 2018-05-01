import React from 'react';

class Review extends React.Component {
  constructor(props){
    super(props)
    this.state = {}
  }

  render(){
    return(
      <div>
        <p>{this.props.text}</p>
      </div>
    )
  }
}

export default Review;
