# MasMovil Chaos Engineering

> **Warning** <br>
> <br>
> Be aware that Chaos engineering is a powerful tool for improving the resiliency and reliability of software systems, but **it should be approached with caution.** <br>
<br>**Introducing chaos into a system can have unintended consequences that could cause significant damage or downtime.**

## Overview

This folder contains all the documentation regarding the Chaos Engineering application through [LitmusChaos](https://docs.litmuschaos.io/).

It consist of the following sections:

- **Experiments**: contains all the information regarding the execution of experiments as well as their implementation files in `.yaml` format.

## What is Chaos Engineering?

**Chaos engineering is the practice of deliberately introducing failures or errors into a software system in order to test its resiliency and identify potential weaknesses. The goal of chaos engineering is to proactively identify and fix issues before they can cause major problems or downtime for users.**

In a chaos engineering experiment, a team might intentionally shut down a server, simulate heavy network traffic, or otherwise disrupt normal system behavior. They would then monitor the system's response and collect data on how the system recovered from the disruption.

By running controlled experiments like this, teams can gain a better understanding of how their systems behave under stress and identify potential weaknesses in the infrastructure or software. This can help teams build more resilient systems that can better handle unexpected issues and avoid downtime or service disruptions.
