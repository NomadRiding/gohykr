import React from 'react'

const TableRow = props => (
  <tr id={`itinerary_${props.id}`}>
    <td>
      props.start_date
    </td>
    <td>
      props.end_date
    </td>
    <td>
      props.available_seat
    </td>
    <td>
      props.eta
    </td>
    <td>
      props.start_location
    </td>
    <td>
      props.end_location
    </td>
    <td>
      props.short_description
    </td>
    <td>
      props.username
    </td>
  </tr>
)

export default TableRow
