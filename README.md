<!-- PROJECT LOGO -->
<br />

<div align="center">

![GitHub repo size](https://img.shields.io/github/repo-size/hellodvh/GoStep?color=0a84ff&style=for-the-badge)
![GitHub language count](https://img.shields.io/github/languages/count/hellodvh/GoStep?color=ff3a30&logoColor=ffa01c&style=for-the-badge)
![GitHub last commit](https://img.shields.io/github/last-commit/hellodvh/GoStep?color=0a84ff&style=for-the-badge)
![GitHub](https://img.shields.io/github/license/hellodvh/GoStep?color=ff3a30&label=LICENSE&style=for-the-badge)

</div>

<h4 align="center">iOS Expanded: 304</h4>
<h6 align="center">iOS304 2022</h6>
<h5 align="center">Dylan Vanhout 190160</h5>
<p align="center">
</br>
   
  <a href="https://github.com/hellodvh/GoStep">
    <img src="Images/Icon.png" alt="Logo" width="140" height="140">
  </a>
  
  <h3 align="center">GoStep</h3>

  <p align="center">
    GoStep is a mobile application made for Apple iPhone devices. The app is suited for people of all fitness levels to track and view the details of their daily walking and running activities. The app features a variety of health stats and additional features such as a speedometer and map.
<br>
      <a href="https://github.com/hellodvh/GoStep/"><strong>Explore the docs »</strong></a>
      <br />
      <br />
      <a href="https://youtube.com">View Demo</a>
       ·
       <a href="https://github.com/hellodvh/GoStep/issues">Report Bug</a>
       ·
       <a href="https://github.com/hellodvh/GoStep/issues">Request Feature</a>
   </p>


<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Project Description](#project-description)
  * [Built with](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Features and Functionality](#features-and-functionality)
   * [Features](#features)
   * [Functionality](#functionality)
* [Concept Process](#concept-process)
   * [Ideation](#ideation)
   * [Wireframes](#wireframes)
   * [User-flow](#user-flow)
* [Development Process](#development-process)
   * [Implementation Process](#implementation-process)
        * [Highlights](#highlights)
        * [Challenges](#challenges)
   * [Reviews and Testing](#reviews-and-testing)
   * [Future Implementation](#future-implementation)
* [Final Outcome](#final-outcome)
   * [Mockups](#mockups)
   * [Promotional Video](#promotional-video)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)

<!--PROJECT DESCRIPTION-->
## About the Project

![image1][image1]

### Project Description
This app is allows the user to track their location by granting permission on the device.
This app uses Health Kit to access the users health stats and display them within the app.
This app uses MapKit to display geographic maps, landmarks and the users location.
This app uses Core Location to display the users current location and to calculate the average speed in kilometers

### Built With
[![Github os](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)]()
[![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white)]()
[![Xcode](https://img.shields.io/badge/Xcode-007ACC?style=for-the-badge&logo=Xcode&logoColor=white)]()
[![Figma](https://img.shields.io/badge/figma-%23F24E1E.svg?style=for-the-badge&logo=figma&logoColor=white)]()



<!-- GETTING STARTED -->
## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

For development, the latest version of `XCode` is required. The latest version can be downloaded from the Apple App Store.

### Installation
Here are a couple of ways to clone this repo:

1. Xcode </br>

`XCode` -> `File` -> `Clone Repository` -> `Git`
Enter the Git repository URL into the URL field and press the `Clone` button.
  ```sh 
  https://github.com/hellodvh/GoStep.git
  ``` 
2. Git Clone Repository

Run the following in the git command-line in the terminal:
  ```sh
   git clone https://github.com/hellodvh/GoStep.git
  ```
Open `XCode` and select `File | Open` from the menu. Select `Open Project/Solution` and select the cloned directory and press `Open` button.

3. Build and Run

<!-- FEATURES AND FUNCTIONALITY-->
## Features and Functionality

### Features

### Onboarding View 

![image2][image2]

Onboarding views for the user to learn about the app.

### Authentication View.

![image4][image4]

Authenticates the user with Face or Touch biometrics.

### Health Stats View.

![image3][image3]

Displays the users health stats collected and stored on the device using HealthKit.

### Speed View.

![image6][image6]

A Speedometer to display the users current walking and running speed.

### Maps View.

![image5][image5]

The user can search the map for points of interest (landmarks) and plot a walking route from start to finish.


### Designs created by Dylan.

Figma was used to design the user interfaces.

### Functionality

* `Onboarding Views` Allows the users to learn about the app.
* `Authentication View` uses FaceID and TouchID and utilizes Local Authentication to grant access to the App.
* `Health Stats View` aka Dashboard View, shows the different categories of Health data which utilizes HealthKit.
* `Health Stats Details View` shows the deatiled view of each catergorie using Charts and Lists.
* `Speed View` shows the users current speed in kilometers. Makes use of Core Location framework.
* `Map View`  shows the users precise location on a map. Allows the user to search for points of interest and then plots the walking direction from start to finish.
* `Search` functionality implement on the Maps View, which allows the user to search for landmarks.

<!-- CONCEPT PROCESS -->
## Concept Process

The `Conceptual Process` is the set of actions, activities and research that was done when starting this project.

### Ideation

![image7][image7]

### Wireframes

![image8][image8]

### User-flow Diagram

![image9][image9]

<!-- DEVELOPMENT PROCESS -->
## Development Process

The `Development Process` is the technical implementations and functionality done in the backend of the application.

### Implementation Process

#### Design Architecture
* `SwiftUI`,`Swift` and `iOS 16`.
* `MVVM` (Model-View-ViewModel) software desing pattern used to seperate the program logic and user interface controls.
#### Highlights

* Learning how to use device sensors for location and steps tracking using HealthKit
* Developing in the Apple XCode environment and using the Simulator.

#### Challenges

* Bugs with FaceID not working when clicking Authenticate Button.
* Bugs with Maps direction path not showing.

### Reviews and Testing


#### Future Implementation

* Fix bugs with map direction and bugs with biometric FaceID.

<!-- MOCKUPS -->
## Final Outcome

### Mockups

![image11][image11]

<!-- PROMO VIDEO -->
## Promotional Video

To see the promotional video, click below:

[View Promotional Video](https://youtube.com)

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/hellodvh/GoStep/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- AUTHORS -->
## Authors

* **Dylan Vanhout** - [DylanVanhout](https://github.com/hellodvh)

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.\

<!-- LICENSE -->
## Contact
* **Dylan Vanhout**  - 190160@virtualwindow.co.za
* **Project Link** - https://github.com/hellodvh/GoStep

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [SwiftUI](https://developer.apple.com/xcode/swiftui/)
* [XCode](https://developer.apple.com/xcode/)
* [MapKit](https://developer.apple.com/documentation/mapkit/)
* [CoreLocation](https://developer.apple.com/documentation/corelocation)
* [HealthKit](https://developer.apple.com/documentation/healthkit)
* [Lecturer](https://github.com/ArmandPret)


<!-- MARKDOWN LINKS & IMAGES -->
[image1]: Images/Image1.png
[image2]: Images/Image2.png
[image3]: Images/Image3.png
[image4]: Images/Image4.png
[image5]: Images/Image5.png
[image6]: Images/Image6.png
[image7]: Images/Image7.png
[image8]: Images/Image8.png
[image9]: Images/Image9.png
[image10]: Images/Image10.png
[image11]: Images/Image11.png

 
