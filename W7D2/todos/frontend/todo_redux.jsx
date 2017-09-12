import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// const applyMiddlewares = (store, mwareList) => {
//   let dispatch = store.dispatch;
//   mwareList.forEach((el) => {
//     dispatch = el(store)(dispatch);
//   });
//   return Object.assign({}, store, { dispatch });
// }



document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
