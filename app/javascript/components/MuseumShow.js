import React from 'react';



class MuseumShow extends React.Component {
  constructor(props){
      super(props)
      this.state = {
        museumInfo: {}
      }

  }

  componentDidMount(){
  let museumId = this.props.params.id

  fetch(`/api/v1/museums/${museumId}`)
.then(response => {

  if (response.ok) {
    return response;
  } else {
    let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage);
    throw(error);
  }
})
.then(response => response.json())
.then(body => {
  console.log(body)
  this.setState({
    museumInfo: body.museum
  });

})
.catch(error => console.error(`Error in fetch: ${error.message}`));

}

  render() {

      return(
        <div>
        <div><b>Details of Museum:</b></div>
        <div>
          {this.state.museumInfo.name}<br/>
          {this.state.museumInfo.location}<br/>
          {this.state.museumInfo.description}<br/>
          {this.state.museumInfo.founding_date}<br/>
          {this.state.museumInfo.url}
        </div>
      </div>


      )
    }



}


export default MuseumShow;
