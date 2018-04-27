import React from 'react';

class GenreShow extends React.Component {
  constructor(props){
      super(props)
      this.state = {
        museums: []
      }
}

componentDidMount(){
let genreId = this.props.params.id
fetch(`/api/v1/genres/${genreId}`)
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
    genreInfo: body.genre
  });

})
.catch(error => console.error(`Error in fetch: ${error.message}`));
}

render() {
    return(
        <div>
          <div><h1>Details of Genre:</h1></div>
          <div>
            <h1>{this.state.genreInfo.name}</h1><br/>
          </div>
      </div>
      )
    }
}

export default GenreShow;
