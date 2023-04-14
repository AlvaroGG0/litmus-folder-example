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
    <td>TOTAL_CHAOS_DURATION (sec): 900<br>
      CHAOS_INTERVAL (sec): 60-120<br>
      RANDOMNESS: true<br>
      FORCE: true<br></td>
  </tr>
  <tr>
    <td align=center><b>Probes</b></td>
    <td></td>
  </tr>
  <tr>
    <td align="center"><b>Blast-Radius</b></td>
    <td colspan="2">In case the hypothesis is not fulfille, there is a risk that the attacked service will be stopped.</td>
  </tr>
</tbody>
</table>