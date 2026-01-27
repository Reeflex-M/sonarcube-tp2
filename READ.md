cmd lancement sonarcude :

sonar-scanner \
  -Dsonar.projectKey=test-vuln-app \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=sqp_5633c5be79491374b3f8955577531ca986d3ba35

  