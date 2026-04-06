# Design and Dynamic Simulation of a Fixed-Wing UAV

## Overview
This project focuses on the **complete design and dynamic simulation of a fixed-wing Unmanned Aerial Vehicle (UAV)**. It was developed as part of the *Unmanned Aerial Systems (UAS)* course.

The work integrates **aerodynamic design, stability analysis, and control system design**, culminating in a **closed-loop simulation using PID control**.

---

## Objectives
- Design a fixed-wing UAV based on mission requirements  
- Generate aerodynamic data for the aircraft  
- Analyze **static and dynamic stability**  
- Identify unstable modes of motion  
- Design a **PID controller** to stabilize the system  

---

## Methodology

### 1. Aircraft Design
- Wing, tail, and fuselage designed based on standard UAV sizing methods  
- Airfoil selection and geometric parameters defined  

### 2. Aerodynamic Analysis
- Aerodynamic coefficients obtained using:
  - XFOIL  
  - XFLR5  
  - AVL  
- Lift, drag, and moment characteristics evaluated  

### 3. Stability Analysis
- Linearized equations of motion derived  
- State-space model constructed  
- Stability derivatives computed  
- Dynamic modes identified:
  - Short Period  
  - Phugoid  
  - Dutch Roll  
  - Roll Mode  
  - Spiral Mode  

### 4. Control System Design
- PID controller designed for unstable modes  
- Transfer functions extracted from state-space model  
- Controller tuned using MATLAB  

### 5. Simulation
- Open-loop and closed-loop simulations performed  
- Time-domain responses analyzed  
- Stability improvement verified  

---

## Tools & Technologies
- MATLAB
- XFLR5 / AVL  
- LaTeX  

---

## Key Results
- Successfully designed a fixed-wing UAV configuration  
- Identified and analyzed dynamic instability modes  
- Stabilized the aircraft using PID control  
- Demonstrated improved response in closed-loop simulation  

---

## Repository Structure
├── data/ # Aerodynamic data

├── src/ # MATLAB scripts and models

├── docs/ # Reports and documentation

├── results/ # Simulation outputs and plots

└── README.md


---

## How to Run
1. Clone the repository:
   ```bash
   git clone https://github.com/Deepak7781/UAS_Design_Project.git
Open MATLAB

Run the main script:
run.m
View simulation results and plots
