import React, { Component } from 'react';

const SearchForm = props => {
  let handleSearch = (event) => {
    props.handleSearch(event.target.value);
  };

  let Search = <span>
    <input
      type='text'
      onChange={handleSearch}
      placeholder="Search museum genre!"
    />
  </span>;

  return(
    <div className="hello-text">
      {Search}<br/><br/>
    </div>
  );
};

export default SearchForm;
