import React from "react";
import { browserHistory, Route, Router, IndexRoute } from "react-router";

import GenresListContainer from "./GenresListContainer";
import GenreShow from "../GenreShow";

const App = (props) => {
  return(
    <Router history={ browserHistory }>
      <Route path="/">
        <IndexRoute component={ GenreListContainer } />
        <Route path="/genres" component={ GenreListContainer } />
        <Route path="/genres/:id" component={ GenreShow } />
      </Route>
    </Router>
  )
};

export default App;
