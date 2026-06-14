
# UART Communication System using Verilog HDL

## Project Overview

This project implements a UART (Universal Asynchronous Receiver Transmitter) communication system using Verilog HDL. The design consists of separate UART Transmitter and UART Receiver modules that communicate through a serial data line.

The project demonstrates the basic principles of serial communication by transmitting an 8-bit data value from the transmitter and receiving the same data through a loopback connection.

The functionality of the design was verified using a Verilog testbench and simulation in Xilinx Vivado.

---

## Objective

The objective of this project is to:

- Design a UART Transmitter
- Design a UART Receiver
- Implement serial data communication
- Verify data transmission through loopback simulation
- Understand basic digital communication protocols

---

## Features

- 8-bit data transmission
- UART Transmitter module
- UART Receiver module
- Start and Stop bit framing
- Shift register based serial communication
- Loopback simulation
- Functional verification using testbench

---

## Design Description

The UART communication system consists of two modules.

### UART Transmitter

The transmitter accepts 8-bit parallel data and converts it into serial form by adding start and stop bits before transmission.

### UART Receiver

The receiver detects the start bit and reconstructs the serial data back into an 8-bit parallel output.

### Loopback Connection

The transmitter output is directly connected to the receiver input to verify successful data transfer.

---

## Working Principle

1. The transmitter receives an 8-bit input.
2. A start bit and stop bit are added.
3. Data is transmitted serially.
4. The receiver detects the start bit.
5. Incoming bits are stored in a shift register.
6. The received byte is reconstructed.
7. The received data is compared with the transmitted data.

---

## Simulation and Verification

The UART design was verified using a Verilog testbench.

The following operations were tested:

- Reset operation
- Data transmission
- Serial communication
- Data reception
- Loopback verification

Simulation confirmed successful transmission and reception of the input data.

---

## Tools Used

- Verilog HDL
- Xilinx Vivado
- Vivado Simulator

---

## Project Files

```
uart_tx.v
uart_rx.v
tb_uart_loopback.v
uart_waveform.png
README.md
```

---

## Applications

- Serial communication systems
- Embedded systems
- FPGA designs
- Microcontroller interfaces
- Computer peripherals

---

## Future Improvements

- Baud rate generator
- Configurable baud rates
- Parity bit support
- Multiple stop bits
- FPGA implementation

---

## Author

Metla Pranathi

Bachelor of Technology
Electronics and Communication Engineering
