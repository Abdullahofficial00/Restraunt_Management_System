const Image = require('../models/Image');

const uploadImage = async (req, res) => {
    try {
        const { originalname, buffer, mimetype } = req.file;

        const newImage = new Image({
            name: originalname,
            data: buffer,
            contentType: mimetype,
        });

        await newImage.save();

        res.status(201).json({ message: 'File uploaded successfully' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal Server Error', error: error.message });
    }
};

const getAllImages = async (req, res) => {
    try {
      // Retrieve all images from the database
      const images = await Image.find();
  
      // Check if there are no images
      if (!images || images.length === 0) {
        return res.status(404).json({ message: 'No images found' });
      }
  
      // Extract image URLs from the array of images
      const imageUrls = images.map(image => ({
        id: image._id, // Assuming you have an _id field in your image schema
        url: `/api/images/${image._id}`,
      }));
  
      // Send the list of image URLs as a response
      res.json(imageUrls);
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: 'Internal Server Error', error: error.message });
    }
  };
  
module.exports = { uploadImage, getAllImages };