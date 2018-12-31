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
    <form className="form-inline md-form mr-auto mb-4" onSubmit={this.handleSubmit}>
        <h1 className="section__headline">Find a roadtrip Near you</h1>
      <br />
      <div className="spacerForm">
        <input className="form-control mr-sm-2"
        id="search"
        type="text"
        aria-label="Search"
        placeholder="City"
        value={value}
        onChange={this.handleChange}
        />
          <button className="btn aqua-gradient btn-rounded btn-sm my-0"
        type="submit"
        value="Search!"
        >Search</button>
        </div>
    </form>
    )
  }
}

export default Search;
