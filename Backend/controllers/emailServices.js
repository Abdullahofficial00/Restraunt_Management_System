const { createTransporter } = require('../models/Email');

const sendMail = async (to, subject, html) => {
    const transporter = createTransporter();

    const info = await transporter.sendMail({
        from: '"MoodyFoody" <mabdullahamanat2810@gmail.com>',
        to: to,
        subject: subject,
        html: html,
    });

    console.log("MSG: %s", info.messageId);
    return info;
}

module.exports = {
    sendMail,
};
