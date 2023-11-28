const nodemailer = require('nodemailer');

const createTransporter = () => {
    return nodemailer.createTransport({
        host: "smtp.mailtrap.io",
        port: 2525,
        auth: {
            user: "481509a1869f11",
            pass: "32636a416643e5"
        }
    });
}

module.exports = {
    createTransporter,
};