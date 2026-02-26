# CivicLens 🏙️
**Empowering Citizens through AI-Driven E-Governance**

## 💡 The Vision
**CivicLens** is a citizen-centric e-governance platform designed to bridge the gap between residents and municipal authorities. 

Urban infrastructure maintenance often suffers from a "Trust Deficit." Citizens find reporting civic hazards (like severe potholes, broken streetlights, or illegal dumping) tedious due to bureaucratic friction. Meanwhile, municipal bodies struggle to triage reports effectively, verify if contractors actually completed repairs, and keep citizens updated. 

CivicLens turns a complex reporting process into a seamless, 10-second action using GenAI.

## ✨ Core Features (In Development)

* **📸 AI-Powered Hazard Detection:** Citizens simply point their camera at a civic issue. We utilize Google Gemini 2.5 Flash to instantly analyze the photo, identify the hazard type, and assess its severity (High/Medium/Low) to help authorities prioritize tickets.
* **📍 Precision Geotagging:** Integrates mobile Location Services with OpenStreetMap to pinpoint the exact latitude and longitude of the reported hazard, removing ambiguity for maintenance crews.
* **👍 Community Ticket Management:** To prevent duplicate reports and prioritize critical infrastructure failures, citizens can view nearby pending hazards on a live map and manually upvote them to increase their visibility to city officials.
* **🔄 The "Trust Loop" Verification:** Once a municipal contractor claims a repair is finished, any citizen can re-scan the location. The AI compares the new photo against the original to scientifically verify the fix before the ticket is officially closed.

## 🚀 Tech Stack
* **Frontend:** Flutter (Dart)
* **AI Engine:** Google Gemini 2.5 Flash
* **Backend & Database:** Firebase (Authentication & Cloud Firestore)
* **Mapping:** OpenStreetMap & `flutter_map`

## 🛠️ Local Setup & Installation

To run this project locally during the development phase:

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/abhayd04/Civiclens-SSH36.git](https://github.com/abhayd04/Civiclens-SSH36.git)
    ```
2.  **Install Dependencies:**
    Navigate to the project directory and run:
    ```bash
    flutter pub get
    ```
3.  **Environment Variables:**
    * Ensure you have a valid Firebase project configured.
    * *Note: API keys for Google Generative AI are managed securely and must be injected into your local environment prior to building.*
4.  **Run the App:**
    ```bash
    flutter run
    ```

---
*Developed during the 36-Hour Hackathon Phase