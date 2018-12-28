import React, { Component } from 'react'
import axios from 'axios'
import TableRow from './TableRow'

export default class Itineraries extends Component {
  state = {
    itineraries: [{}, {}, {}, {}, {}]
  }

  fetchItineraries = () => {
    axios.get('/itineraries.json')
      .then(response => {
        const { itineraries } = response.data
        this.setState({ itineraries })
      })
  }

  render() {
    const { itineraries } = this.state
    return (
      <table className="table">
        <thead>
          <tr>
            <th style={{ width: '15%' }}>Start date</th>
            <th style={{ width: '15%' }}>Due date</th>
            <th style={{ width: '15%' }}>Available seat</th>
            <th style={{ width: '15%' }}>ETA</th>
            <th style={{ width: '15%' }}>Start Loc</th>
            <th style={{ width: '15%' }}>End Loc</th>
            <th style={{ width: '15%' }}>Description</th>
            <th style={{ width: '15%' }}>Username</th>
          </tr>
        </thead>
        <tbody>
          {
            tasks.map((task, index) => {
              return <TableRow key={index} {...task} />
            })
          }
        </tbody>
      </table>
    )
  }

  componentDidMount() {
    this.fetchItineraries()
  }
}
