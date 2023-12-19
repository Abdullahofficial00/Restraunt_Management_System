const express = require('express');
const multer = require('multer');
const { uploadImage, getAllImages } = require('../controllers/image.controller');

const router = express.Router();
const upload = multer({ storage: multer.memoryStorage() });

router.post('/upload', upload.single('image'), uploadImage);
router.get('/images', getAllImages);

module.exports = router;