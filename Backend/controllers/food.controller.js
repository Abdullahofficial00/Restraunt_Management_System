const Food = require('../models/Food')

async function fooddasbhard(req,res){
    res.status(200).json({message:'welcome to Food Dashboard'});
  }

async function createFood(req, res) {
    try {
      const existingName = await Food.findOne({ Name: req.body.Name });
      if (existingName) {
        return res.status(400).json({ message: 'Food already exists' });
      }
      const newFood = await Food.create(req.body);
      res.status(201).json({ food: newFood, message: 'Food added successfully' });
  
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
  
  async function getAllFood(req, res) {
      try {
        const foods = await Food.find();
        res.status(200).json(foods);
      } catch (error) {
        res.status(500).json({ error: error });
      }
    }
  
    async function updateFood(req, res) {
      try {
        const foodId = req.params.id;
        const updatedData = req.body; 
    
        const updatedFood = await Food.findOneAndUpdate({ _id: foodId }, updatedData, { new: true });
    
        if (!updatedFood) {
          return res.status(404).json({ message: 'Food not found' });
        }
    
        if (!updatedFood._id) {
          return res.status(200).json({ message: 'No updates were made' });
        }
        console.log('Food updated successfully');
        res.status(200).json({ message: 'Food updated successfully' });
      } catch (error) {
        res.status(500).json({ error: error });
      }
    }
  
    async function deleteFood(req, res) {
      try {
        const foodId = req.params.id; 
    
        const deletedFood = await Food.findByIdAndRemove(foodId);
    
        if (!deletedFood) {
          return res.status(404).json({ message: 'Food not found' });
        }
    
        res.status(200).json({ message: 'Food deleted successfully' });
      } catch (error) {
        res.status(500).json({ error: error });
      }
    }
  
  module.exports={
      createFood,
      getAllFood,
      updateFood,
      deleteFood,  
      fooddasbhard,    
  }