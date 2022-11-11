import cv2
import matplotlib.pyplot as plt
import cvlib as cv
import urllib.request
import numpy as np
from cvlib.object_detection import draw_bbox
import concurrent.futures

url = "http://192.168.1.34/320x240.jpg" #cam url stream
im = None #sets the var im to NULL

def run1():
    cv2.namedWindow("live transmission", cv2.WINDOW_AUTOSIZE) #open live stream video before image processing
    while True: #infinite loop
        img_resp = urllib.request.urlopen(url) #open the cam stream
        imgnp = np.array(bytearray(img_resp.read()), dtype=np.uint8)
        im = cv2.imdecode(imgnp, -1) # is used to read image data from a memory cache and convert it into image format. This is generally used for loading the image efficiently from the internet.

        cv2.imshow('live transmission', im) #used to display an image in a window.
        key = cv2.waitKey(5) #show the image for 5 seconds before it automatically closes.
        if key == ord('q'): #if 'q' is pressed closes the window
            break

    cv2.destroyAllWindows()

def run2():
    cv2.namedWindow("detection", cv2.WINDOW_AUTOSIZE) #open the window that shows the image detection
    while True: #infinite loop
        img_resp = urllib.request.urlopen(url) #open the cam stream
        imgnp = np.array(bytearray(img_resp.read()), dtype=np.uint8)
        im = cv2.imdecode(imgnp, -1) # is used to read image data from a memory cache and convert it into image format. This is generally used for loading the image efficiently from the internet.

        bbox, label, conf = cv.detect_common_objects(im) #creates a box around the detected object
        im = draw_bbox(im, bbox, label, conf) #draws the box with the label of the object and confidence level and the image itself

        cv2.imshow('detection', im) #shows the window of live detection
        key = cv2.waitKey(5) #show the image for 5 seconds before it automatically closes.
        if key == ord('q'): #if 'q' is pressed closes the window
            break

    cv2.destroyAllWindows()


if __name__ == '__main__':
    print("started")
    with concurrent.futures.ProcessPoolExecutor() as executer:
        f1 = executer.submit(run1) #runs the func run1
        f2 = executer.submit(run2) #runs the func run2
