import React from 'react';

class Nav extends React.Component {
    render () {
        return (
            <div className="navigation"> 
            
                {/* { this.props.name }
                <h1>WTF react!?</h1>     */}
                <ul>

                    <li>
                        Available Itineraries
                    </li>
                    <li> 
                        Post a Ride
                    </li>
                    <li>
                        Events
                    </li>
                    <li>
                        About
                    </li>
                    <li>
                        How it Works
                    </li>
                    <li>
                        FAQ
                    </li>
                    <li>
                        Sign Up or Log In
                    </li>
                </ul>
            </div>
        )
    }
}

export default Nav;