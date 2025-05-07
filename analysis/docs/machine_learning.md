# Machine Learning Model Hyperparameters and Performance Metrics for SLEAP and DeepLabCut

## Key Hyperparameters for SLEAP and DeepLabCut

Before training pose estimation models with SLEAP or DeepLabCut (DLC), you can adjust several hyperparameters that affect how the model learns and performs:

### Common Hyperparameters

- **Batch Size**
  The number of images processed at once during training.
  *Larger batch sizes can speed up training but require more GPU memory.*

- **Learning Rate**
  Controls how much the model weights are updated during training.
  *Too high can cause unstable training; too low can make training slow or get stuck.*

- **Number of Epochs**
  How many times the model sees the entire training dataset.
  *More epochs can improve accuracy but may lead to overfitting.*

- **Optimizer**
  The algorithm used to update model weights (e.g., Adam, SGD).
  *Different optimizers can affect training speed and final accuracy.*

- **Augmentation Settings**
  Techniques like rotation, scaling, flipping, or color changes applied to images during training.
  *Helps the model generalize better to new data.*

- **Network Architecture**
  The type of neural network used (e.g., ResNet, UNet, MobileNet).
  *Affects speed, accuracy, and resource requirements.*

- **Input Image Size**
  The resolution of images fed into the model.
  *Higher resolutions can improve accuracy but require more memory and computation.*

#### SLEAP-Specific Hyperparameters

- **Maximum Instances**
  Maximum number of animals/objects expected in a frame.

- **Peak Threshold**
  Confidence threshold for detecting keypoints.

#### DeepLabCut-Specific Hyperparameters

- **num_trainings**
  Number of training iterations (steps).

- **snapshot**
  Which saved model checkpoint to use for evaluation or inference.

## Model Performance Metrics

After training, SLEAP and DLC provide several metrics to help you understand how well your model is performing:

### Common Metrics

- **Train Loss / Validation Loss**
  Measures how well the model fits the training/validation data.
  *Lower loss means better fit. If validation loss is much higher than train loss, the model may be overfitting.*

- **Mean Average Precision (mAP)**
  Measures how accurately the model detects keypoints across all classes.
  *Higher mAP (closer to 1.0 or 100%) means better performance.*

- **Root Mean Square Error (RMSE) / Mean Pixel Error**
  Average distance (in pixels) between predicted and true keypoint locations.
  *Lower values mean more accurate predictions.*

- **Percentage of Correct Keypoints (PCK)**
  Percentage of keypoints predicted within a certain distance of the true location.
  *Higher PCK means more accurate keypoint localization.*

- **Recall and Precision**
  - *Recall*: Fraction of true keypoints detected by the model.
  - *Precision*: Fraction of detected keypoints that are correct.

### What These Metrics Mean in Plain English

- **Loss**: How far off the model's predictions are from the correct answers. Lower is better.
- **mAP**: How often the model gets the keypoints right, averaged over all body parts. Higher is better.
- **RMSE/Mean Pixel Error**: On average, how many pixels away the model's predictions are from the true points. Lower is better.
- **PCK**: Out of all the keypoints, what percent did the model get close enough to the right spot? Higher is better.
- **Recall/Precision**: How many real keypoints did the model find (recall), and how many of its predictions were actually correct (precision)?

---

**Tip:**
Always compare metrics on both training and validation/test data. Good performance on training data but poor performance on new data means the model is overfitting and may not generalize well.
