import React from 'react'
import VoteIcon from './VoteIcon'

class Review extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      voteTotal: this.props.vote_total,
      voteMessage: ''
    }
    this.addNewVote = this.addNewVote.bind(this)
    this.handlePlusOneClick = this.handlePlusOneClick.bind(this)
    this.handleMinusOneClick = this.handleMinusOneClick.bind(this)

  }

  handlePlusOneClick(event) {
    event.preventDefault()
    let voteResult = {
      value: "1",
      review: this.props.id
    }
    this.addNewVote(voteResult)
  }

  handleMinusOneClick(event) {
    event.preventDefault()
    let voteResult = {
      value: "-1",
      review: this.props.id
    }
    this.addNewVote(voteResult)
  }

  addNewVote(voteResult) {
    fetch('/api/v1/votes.json', {
      credentials: 'same-origin',
      method: 'post',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify(voteResult)
    })
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`, error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(responseMessage => {
      console.log(responseMessage)
      this.setState({
        voteMessage: responseMessage['body'],
        voteTotal: responseMessage['vote_total']
      })
    })
  }



  render(){
      // let upvoteStyle, downvoteStyle
      // if this.props.voteValue
      let starcomponent = []
      let star = <i className="fas fa-star"></i>
      for (let i = 0; i < this.props.rating; i++) {
        starcomponent.push(star)
      }

      console.log(this.state.voteTotal)

      let messageDiv = <div><p>{this.state.voteMessage}</p></div>


    return(
      <div>
        <p>Review by: {this.props.user}</p>
        <p>Rating: {starcomponent}</p>
        <p>Votes: {this.state.voteTotal}</p>
        <p>{this.props.text}</p>
        <div>{this.state.voteMessage}</div>
        <div className = 'thumbs'>
          <VoteIcon
          icon = 'far fa-thumbs-up'
          ifClicked = {this.handlePlusOneClick}
            />
          <VoteIcon
          icon = "far fa-thumbs-down"
          ifClicked = {this.handleMinusOneClick}
            />
      </div>
      </div>
    )
  }
}

export default Review;
