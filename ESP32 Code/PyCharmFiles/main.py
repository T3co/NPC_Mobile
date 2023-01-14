import cv2
thres = 0.6# Threshold to detect object

classNames = []
classFile = "coco.names"
with open(classFile,'rt') as f:
    classNames=[line.rstrip() for line in f]

configPath = "ssd_mobilenet_v3_large_coco_2020_01_14.pbtxt"
weightsPath = "frozen_inference_graph.pb"

net = cv2.dnn_DetectionModel(weightsPath, configPath)
net.setInputSize(320, 240)
net.setInputScale(1.0 / 127.5)
net.setInputMean((127.5, 127.5, 127.5))
net.setInputSwapRB(True)



def getObjects(img, draw=True,objects=[]):

        classIds, confs, bbox = net.detect(img, confThreshold=thres, nmsThreshold=0.3)
        #print(classIds, bbox)

        objectInfo=[]
        if(len(objects) == 0): objects = classNames
        if len(classIds) != 0:
             for classId, confidence, box in zip(classIds.flatten(), confs.flatten(), bbox):
                 className = classNames[classId - 1]
                 if className in objects:
                     objectInfo.append([box, className])
                     if (draw):
                         cv2.rectangle(img, box, color=(0, 255, 0), thickness=2)
                         cv2.putText(img, className.upper(), (box[0] + 10, box[1] + 30),
                         cv2.FONT_HERSHEY_COMPLEX,1,(0,255,0),2)
                         cv2.putText(img, str(round(confidence * 100, 2)), (box[0] + 200, box[1] + 30),
                         cv2.FONT_HERSHEY_COMPLEX, 1, (0, 255, 0), 2)
        return img, objectInfo


if __name__ == "__main__":
    cap = cv2.VideoCapture("http://10.0.0.20:81/stream")
    #cap.set(3, 1280)
    #cap.set(4, 720)
    #cap.set(10, 70)

    while True:
        success, img = cap.read()
        result,objectInfo = getObjects(img, True)

        cv2.imshow("Detection Window", img)
        cv2.waitKey(1)