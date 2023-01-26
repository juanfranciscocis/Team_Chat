# This code takes a URL of a picture, and returns the bounding boxes and scores of the objects in the picture
# The code uses the DETR model from the Hugging Face library
# The code uses a pretrained model that was trained on the COCO dataset
# The code uses the post_process_object_detection function from the Hugging Face library to convert the model outputs to COCO API
# The code uses the id2label dictionary to convert the label IDs to the corresponding labels

from transformers import DetrImageProcessor, DetrForObjectDetection
import torch
from PIL import Image
import requests

url = "http://images.cocodataset.org/val2017/000000039769.jpg"
image = Image.open(requests.get(url, stream=True).raw)

processor = DetrImageProcessor.from_pretrained("facebook/detr-resnet-101")
model = DetrForObjectDetection.from_pretrained("facebook/detr-resnet-101")

inputs = processor(images=image, return_tensors="pt")
outputs = model(**inputs)

# convert outputs (bounding boxes and class logits) to COCO API
# let's only keep detections with score > 0.9
target_sizes = torch.tensor([image.size[::-1]])
results = processor.post_process_object_detection(outputs, target_sizes=target_sizes, threshold=0.9)[0]

def get_results():
    labels = []
    socores = []
    for score, label, box in zip(results["scores"], results["labels"], results["boxes"]):
        box = [round(i, 2) for i in box.tolist()]
        labels.append(model.config.id2label[label.item()])
        socores.append(score.item())


    return labels,socores





