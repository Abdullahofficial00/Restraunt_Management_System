const jwt = require('jsonwebtoken');
const dotenv= require('dotenv').config();
// Middleware function to validate JWT tokens
function validateToken(req, res, next) {
    var token = req.headers.authorization;
    token = token.split(' ')[1]; //splitting the Bearer token
    if (!token) {
    return res.status(401).json({ message: 'No token provided' });
    }
    jwt.verify(token,process.env.SECRETKEY, (err, decoded) => {
    if (err) {
    return res.status(403).json({ message: 'Failed to authenticate token' });
    }
    // If the token is valid, save the decoded information for later use
    req.user = decoded;
    next();
    });
}

function requireRoles(roles) {
    return (req, res, next) => {
    const userRole = req.user.role; // Assuming you saved the user's role in req.user    
    if (roles.includes(userRole)) {    
    // User has one of the required roles, so allow access    
    next();    
    } else {    
    // User does not have any of the required roles, so send a forbidden response    
    res.status(403).json({ message: 'Permission denied' });    
    }    
    };   
    }

module.exports = {
    validateToken,
    requireRoles
};