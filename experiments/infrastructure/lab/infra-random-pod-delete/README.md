# infra-random-pod-delete

<table align="center">
<thead>
  <tr>
    <th align="center" colspan="3">infra-random-pod-delete</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td align="center"><b>Hypothesis</b></td>
    <td colspan="2">If a pod of a random service is terminated, the pod is redeployed in an agile manner.<br></td>
  </tr>
  <tr>
    <td align="center" rowspan="3"><b>Implementation</b></td>
    <td align="center"><b>Type</b></td>
    <td align="center"><a href="https://litmuschaos.github.io/litmus/experiments/categories/pods/pod-delete/" target="_blank" rel="noopener noreferrer">pod-delete</a></td>
  </tr>
  <tr>
    <td align="center"><b>Tunables</b></td>
    <td>TOTAL_CHAOS_DURATION (sec): <i>900</i><br>
      CHAOS_INTERVAL (sec): <i>60-120</i><br>
      RANDOMNESS: <i>true</i><br>
      FORCE: <i>true</i><br></td>
  </tr>
  <tr>
    <td align=center><b>Probes</b></td>
    <td></td>
  </tr>
  <tr>
    <td align="center"><b>Blast-Radius</b></td>
    <td colspan="2">🔵<b>Medium:</b> can cause the failure or affect the performance of more than one non-critical service or component</td>
  </tr>
</tbody>
</table>