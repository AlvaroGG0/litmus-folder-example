# Chaos Engineering Scenarios

## Overview

This folder contains all the information regarding the execution of scenarios as well as their implementation files in `.yaml` format organized by targets and environments.

## Folder Structure

   ``` bash
├── <target> --> (infra, authn...)
│   ├── <env> --> (lab, dev, sta, prod)
│   │   ├── <experiment-name>
│   │   │   ├── <experiment-name>.yaml
│   │   │   ├── README.md 
```

## How do you plan your first Chaos Experiments?

### 1. :mag_right: Identify your objectives

Before you start planning your Chaos Experiment, you need to identify your objectives. What do you want to achieve? What are your goals? What are your key performance indicators (KPIs)? Having clear objectives will help you determine the scope of your experiment.

### 2. :question: Define your hypothesis

Once you have identified your objectives, you need to define your hypothesis. What do you think will happen during the experiment? What are your assumptions? What do you hope to learn? Your hypothesis should be clear, specific, and testable.

### 3. :dart: Choose your target system

Your target system is the system that you will be experimenting on. It can be an application, a service, or an infrastructure component. You need to choose a system that is critical enough to be worth experimenting on, but not so critical that a failure could cause catastrophic consequences.

### 4. :bar_chart: Determine your experiment parameters

Your experiment parameters are the variables that you will manipulate during the experiment. They can include factors such as network latency, CPU usage, memory usage, and so on. You need to determine which parameters are relevant to your objectives and hypothesis.

### 5. :art: Design your experiment

With all of the above steps completed, you can now design your experiment. You need to determine how you will implement your experiment parameters, how long the experiment will run, and how you will collect data. You also need to plan for any contingencies that may arise during the experiment.

#### 5.1. Experiment Schema

<table align="center">
<thead>
  <tr>
    <th align="center" colspan="3">&lt;experiment-name&gt;</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td align="center"><b>Hypothesis</b></td>
    <td colspan="2"></td>
  </tr>
  <tr>
    <td align="center" rowspan="3"><b>Implementation</b></td>
    <td align="center"><a href="https://litmuschaos.github.io/litmus/experiments/categories/contents/" target="_blank" rel="noopener noreferrer"><b>Type</b></a></td>
    <td align="center"></td>
  </tr>
  <tr>
    <td align="center"><b>Tunables</b></td>
    <td align="center">They can be <a href="https://litmuschaos.github.io/litmus/experiments/concepts/chaos-resources/probes/contents/" target="_blank" rel="noopener noreferrer">common</a>, <a href="https://litmuschaos.github.io/litmus/experiments/categories/pods/common-tunables-for-pod-experiments/" target="_blank" rel="noopener noreferrer">pod-specific</a>, <a href="https://litmuschaos.github.io/litmus/experiments/categories/nodes/common-tunables-for-node-experiments/" target="_blank" rel="noopener noreferrer">node-specific</a> or type-specific</td>
  </tr>
  <tr>
    <td align=center><a href="https://litmuschaos.github.io/litmus/experiments/concepts/chaos-resources/probes/contents/" target="_blank" rel="noopener noreferrer"><b>Probes</b></a></td>
    <td align=Center>Pluggable checks that can be defined for any Chaos Experiment which its success is a necessary condition in determining the verdict of the experiment</td>
  </tr>
  <tr>
    <td align="center"><b>Blast-Radius</b></td>
    <td colspan="2">
    🟢<b>Low<br>
    🔵Medium<br>
    🟠High<br>
    🔴Full</b></td>
  </tr>
</tbody>
</table>

#### 5.2. Determine the Blast-Radius level

> The **blast-radius** of a chaos engineering experiment refers to the extent to which the experiment can impact the overall system or application being tested. In other words, **it is the area that may be affected by the experiment in case the hypothesis is not fulfilled.**

The following scale is established to classify scenarios according to their blast-radius:

1. :green_circle: **Low**

If the hypothesis is not fulfilled, this type of scenario can cause the failure or affect the performance of **one non-critical service or component**.

- Delete a single pod or container to see how the application responds to the failure of a single component.
- Introduce a network delay between two pods to see how the system handles slow connections.

2. :large_blue_circle: **Medium**

If the hypothesis is not fulfilled, this type of scenarios can cause the failure or affect the performance of **more than one non-critical service or component**, without causing effects at the node/cluster level.

- Delete a non-critical deployment to test how the system handles failure of less important components.
- Introduce a network delay for all traffic to a specific deployment or service to see how it impacts performance and availability.

3. :orange_circle: **High**

If the hypothesis is not fulfilled, this type of scenarios can cause the failure or affect the performance of **one or more nodes**, without threatening the availability of the entire cluster.

- Simulate a node failure by killing a node and observing how the system handles the disruption.
- Simulate a network partition by blocking network traffic between nodes in a cluster.

4. :red_circle: **Full**

If the hypothesis is not fulfilled, this type of scenario can cause the failure or affect the performance of **the entire cluster**.

- Simulate a complete cluster outage by shutting down all nodes in a cluster and testing how the system recovers from the failure.
- Intentionally overload the Kubernetes control plane by generating a high volume of API requests to see how the system handles extreme load.

### 6. :boom: Run your experiment

Once you have designed your experiment, you can run it. Be sure to follow your plan carefully, and monitor the target system closely during the experiment.

### 7. :memo: Analyze your results

After the experiment is complete, you need to analyze your results. Did the experiment achieve your objectives? Did it confirm or refute your hypothesis? What did you learn?
