import cv2
import numpy as np

# Load the template image
template_image = cv2.imread('./photos/tolgaa2.jpg')

# Define the region of interest (ROI) dimensions in the frame
roi_width = 300
roi_height = 300

# Resize the template image to match the ROI dimensions
template_image = cv2.resize(template_image, (roi_width, roi_height))

# Define a threshold for matching similarity
threshold = 0.3

cam = cv2.VideoCapture(0)

try:    
    # Check if the camera is opened successfully
    if not cam.isOpened():
        raise Exception("Failed to open camera")
    else:
        print("Camera opened successfully!")

    count = 0  # Initialize counter outside the loop

    while True:
        ret, frame = cam.read()

        # Check if the frame was captured successfully
        if not ret:
            print("Failed to capture frame")
            break

        if count % 30 == 0:
            # Perform template matching
            result = cv2.matchTemplate(frame, template_image, cv2.TM_CCOEFF_NORMED)
            _, max_val, _, max_loc = cv2.minMaxLoc(result)

            print('Similarity: {:.2f}'.format(max_val))

        if max_val > threshold:
            top_left = max_loc
            bottom_right = (top_left[0] + roi_width, top_left[1] + roi_height)
            
            # Draw a rectangle around the matched region
            cv2.rectangle(frame, top_left, bottom_right, (0, 255, 0), 2)
            
            # Display the text
            cv2.putText(frame, 'Match found!', (top_left[0], top_left[1] - 10),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)
                
        cv2.putText(frame, 'Similarity: {:.2f}'.format(max_val), (10, 30),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 1)
        
        # Display the frame
        cv2.imshow('Frame', frame)

        # Increment the counter
        count += 1

        # Check for the 'q' key to quit the loop
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

finally:
    # Release the camera
    cam.release()
    # Close all windows
    cv2.destroyAllWindows()
