const express = require('express');
const router = express.Router();
const emailController = require('../controllers/Email.controller');

router.post('/mail', (req, res) => {
    console.log('Received POST request to /api/send-email');
    emailController.sendEmail(req, res);
});

module.exports = router;