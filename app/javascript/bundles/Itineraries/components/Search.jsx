import React, { Component } from 'react';

class Search extends Component {
  state = { value: '' }
  handleSubmit = event => {
    event.preventDefault()
    const { value } = this.state
    this.props.handleSearch(value)
    this.setState({value: ''})
  }

  handleChange = event => {
    let { value } = this.state
    value = event.target.value
    this.setState({ value })
  }
  render() {
    const { value } = this.state
    return (
    <form onSubmit={this.handleSubmit}>
      <h1>LOOK HERE</h1>
      <input
        id="search"
        type="text"
        label="search"
        value={value}
        onChange={this.handleChange}
        />
        <input
        type="submit"
        value="Search!"
        />
    </form>
    )
  }
}

export default Search;
