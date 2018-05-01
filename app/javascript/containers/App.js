import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';

import GenreListContainer from "./GenreListContainer";
import GenreShow from "../components/GenreShow";

import MuseumListContainer from './MuseumListContainer';
import MuseumShow from '../components/MuseumShow';

const App = props => {
  return(
    <Router history={browserHistory}>
      <Route path='/'>
        <IndexRoute component={GenreListContainer}/>
        <Route path="/genres" component={ GenreListContainer } />
        <Route path="/genres/:id" component={ GenreShow } />
        <Route path="/museums" component={MuseumListContainer}/>
        <Route path="/museums/:id" component={MuseumShow} />
      </Route>
    </Router>
  )
}
export default App;
