
# Medical Image Analysis for Automatic Bacterial Cell Counting

## 📌 Project Overview

This project presents an automated image analysis workflow for detecting and counting bacterial cells in fluorescence microscopy images using MATLAB. The application applies image processing techniques to improve image quality, segment bacterial cells, and perform automated cell counting, reducing manual effort while improving accuracy and reproducibility.

---

## 🎯 Objectives

- Automate bacterial cell counting from fluorescence microscopy images.
- Improve counting accuracy using image preprocessing and segmentation techniques.
- Demonstrate the application of medical image analysis in quantitative microbiology.
- Develop an interactive MATLAB graphical user interface (GUI) for automated cell counting.

---

## ✨ Features

- Load fluorescence microscopy images
- Image preprocessing
- Noise reduction
- Contrast enhancement
- Image thresholding
- Morphological image processing
- Bacterial cell segmentation
- Automated bacterial cell counting
- Interactive MATLAB GUI

---

## 🛠️ Technologies Used

- MATLAB
- MATLAB Image Processing Toolbox
- Medical Image Analysis
- Digital Image Processing

---

## 🔄 Workflow

```text
Fluorescence Microscopy Image
            │
            ▼
       Load Image
            │
            ▼
   Image Preprocessing
   • Median Filtering
   • Contrast Enhancement
   • Grayscale Conversion
            │
            ▼
     Cell Segmentation
   • Thresholding
   • Morphological Operations
            │
            ▼
      Cell Detection
            │
            ▼
 Automated Cell Counting
            │
            ▼
   Results Visualization
```

---

## 🔄 Project Workflow

### Step 1: Load Image
Import a fluorescence microscopy image into the MATLAB application.

### Step 2: Image Preprocessing
Improve image quality by:
- Applying median filtering to reduce noise
- Enhancing image contrast
- Converting the image to grayscale

### Step 3: Cell Segmentation
Separate bacterial cells from the background using thresholding and morphological image processing techniques.

### Step 4: Cell Detection
Detect individual bacterial cells from the segmented image.

### Step 5: Automated Cell Counting
Automatically count the detected bacterial cells, eliminating the need for manual counting.

### Step 6: Results Visualization
Display the processed image with detected bacterial cells and the total cell count through the graphical user interface.

---

## 🔬 Methods Used

- Median Filtering
- Contrast Enhancement
- Grayscale Conversion
- Image Thresholding
- Morphological Operations
- Image Segmentation
- Automated Cell Counting

---

## 💡 Skills Demonstrated

- Medical Image Analysis
- Image Processing
- MATLAB Programming
- Computer Vision
- Image Segmentation
- Algorithm Development
- GUI Development
- Quantitative Image Analysis

---

## 📁 Project Structure

```text
medical-image-analysis-cell-counter/
│
├── README.md
├── src/
│   └── cellCounterApp.m
├── data/
│   └── Original_Image1.png
├── results/
│   └── Processed_Image1.png
└── docs/
```

---

## 📊 Results

### Original Fluorescence Microscopy Image

<img src="data/Original_Image1.png" width="500">

### Processed Image

<img src="results/Processed_Image1.png" width="500">

The application successfully detects and segments bacterial cells from fluorescence microscopy images, enabling efficient, accurate, and reproducible automated cell counting.

---

## 📚 References

- Gonzalez, R. C., & Woods, R. E. *Digital Image Processing (3rd Edition).*
- LeCun, Y., Bengio, Y., & Hinton, G. *Deep Learning.* Nature, 2015.

---

## 🎓 Academic Information

Developed as part of **MATH 6346 – Medical Image Analysis** at **The University of Texas at Dallas**.

---

## 👤 Author

**Shradha Upadhyay**
````
