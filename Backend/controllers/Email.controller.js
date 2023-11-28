const emailService = require('./emailServices');

const sendEmail = async (req, res) => {
    try {
        const { to, subject, html } = req.body;

        if (!to || !subject || !html) {
    return res.status(400).json({ error: 'Missing required parameters. Ensure you provide values for "to", "subject", and "html".' });
}

        const result = await emailService.sendMail(to, subject, html);

        res.status(200).json({ message: 'Email sent successfully', result });
    } catch (error) {
        console.error('Error sending email:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
};

module.exports = {
    sendEmail,
};