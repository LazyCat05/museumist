import React from 'react'
import RatingField from '../components/RatingField'
import BodyField from '../components/BodyField'

class ReviewForm extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      reviewRating: '1',
      reviewBody: '',
      errors: {}
    }
    this.handleRatingInput = this.handleRatingInput.bind(this)
    this.handleBodyInput = this.handleBodyInput.bind(this)
    this.clearFields = this.clearFields.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleRatingInput(event) {
    this.setState({ reviewRating: event.target.value })
  }

  handleBodyInput(event) {
    this.setState({ reviewBody: event.target.value })
  }

  clearFields(event) {
    event.preventDefault()
    this.setState({ reviewRating: '1' }),
    this.setState({ reviewBody: '' })
  }

  validateReviewRating(selection) {
    if (selection.trim() === '') {
      let newError = { reviewRating: 'Please enter a rating.' }
      this.setState({ errors: Object.assign(this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.reviewRating
      this.setState({ errors: errorState })
      return true
    }
  }

  validateReviewBody(selection) {
    if (selection.trim() === '') {
      let newError = { reviewBody: 'Please enter review content.' }
      this.setState({ errors: Object.assign(this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.reviewBody
      this.setState({ errors: errorState })
      return true
    }
  }


  handleSubmit(event) {
    event.preventDefault()
    if(this.validateReviewRating(this.state.reviewRating) && this.validateReviewBody(this.state.reviewBody)) {
      let formPayload = {
        rating: this.state.reviewRating,
        body: this.state.reviewBody,
        museum_id: this.props.museumId
      }
      this.props.addNewReview(formPayload)
    }
  }

  render() {
    let errorDiv;
    let errorItems;

    if(Object.keys(this.state.errors).length > 0) {
    errorItems = Object.values(this.state.errors).map(error => {
    return(<li key={error}>{error}</li>)
    })
    errorDiv = <div className="callout alert">{errorItems}</div>
  }

    return(
      <div>
        <h2 className="add-a-review">Add a review!</h2>
        {errorDiv}
        <form className="field small-8 columns" onSubmit={this.handleSubmit}>
          <RatingField
            content={this.state.reviewRating}
            label="Museum Rating (1-5)"
            name="review-rating"
            handleInput={this.handleRatingInput}
          />
          <BodyField
            content={this.state.reviewBody}
            label="Review:"
            name="review-body"
            handleInput={this.handleBodyInput}
          />
          <div>
            <ul className="button-group">
            <input type="submit" className="button radius" value="Clear" onClick={this.clearFields}/>
            &nbsp;
            <input type="submit" value="Add Review" className="button radius"/>
          </ul>
          </div>
        </form>
      </div>
    )
  }
}

export default ReviewForm;
