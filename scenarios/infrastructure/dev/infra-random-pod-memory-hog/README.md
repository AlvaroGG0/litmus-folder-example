# infra-random-pod-cpu-hog

<table align="center">
<thead>
  <tr>
    <th align="center" colspan="3">infra-random-pod-cpu-hog</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td align="center"><b>Hypothesis</b></td>
    <td colspan="2">If there is an increase in the CPU consumption of a random pod, the pod is capable of auto-scaling itself to guarantee availability.<br></td>
  </tr>
  <tr>
    <td align="center" rowspan="3"><b>Implementation</b></td>
    <td align="center"><b>Type</b></td>
    <td align="center"><a href="https://litmuschaos.github.io/litmus/experiments/categories/pods/pod-cpu-hog/" target="_blank" rel="noopener noreferrer">pod-cpu-hog</a></td>
  </tr>
  <tr>
    <td align="center"><b>Tunables</b></td>
    <td>TOTAL_CHAOS_DURATION (sec): <i>360</i><br>
      CPU_CORES: <i>0</i><br>
      CPU_LOAD: <i>80</i><br></td>
  </tr>
  <tr>
    <td align=center><b>Probes</b></td>
    <td></td>
  </tr>
  <tr>
    <td align="center"><b>Blast-Radius</b></td>
    <td colspan="2">🟢<b>Low:</b> can cause the failure or affect the performance of one non-critical service or component.</td>
  </tr>
</tbody>
</table>