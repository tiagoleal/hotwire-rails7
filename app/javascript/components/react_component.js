import React from 'react';
import ReactDom from 'react-dom'

const e = React.createElement

class Hello extends React.Component {
  render() {
    return e('div', null, `Hello ${this.props.toWhat}`);
  }
}

ReactDom.render(
  e(Hello, { toWhat: 'World 123' }, null),
  document.getElementById('react')
)