# Circle Hough Scanner

MATLAB project for detecting marked circles in scanned answer-sheet style images using Hough-transform-based line and circle detection.

## What it does
- Straightens each image by estimating rotation from edge/FFT features.
- Finds 8 target circles with a custom circle Hough transform.
- Crops each circle and detects whether a cross mark is present.
- Returns a `4 x 2` binary result matrix (`A/B` choices for 4 questions).

## Repository layout
- `/main.m` – entry point.
- `/processor.m` – end-to-end image processing pipeline.
- `/circle_hough.m`, `/my_hough.m`, `/non_max_sup.m` – Hough transform utilities.
- `/process_circles.m`, `/detect_cross.m` – mark detection logic.
- `/find_rotation_angle.m` – image deskew angle estimation.
- `/input/` – sample images.

## Usage
1. Open the project in MATLAB.
2. Run `main.m`.
3. Check console output and optional debug figures (`verbose = true` in `main.m`).

Documented by Copilot.
