# sonarcube-tp3
curl -s ”http://localhost:9000/api/system/status” | jq  

curl -s -u "$SONAR_TOKEN:" "$SONAR_URL/api/authentication/validate" | jq

curl -s -u "$SONAR_TOKEN:" "$SONAR_URL/api/projects/search" | jq '.components[]'

curl -s -u "$SONAR_TOKEN:" "$SONAR_URL/api/measures/component?component=$PROJECT&metricKeys=$METRICS" | jq '.component.measures[]'
curl -s -u "$SONAR_TOKEN:" "$SONAR_URL/api/measures/component?component=$PROJECT&metricKeys=$METRICS" | jq '.component.measures[]'

curl -s -u "$SONAR_TOKEN:" "$SONAR_URL/api/measures/component?component=$PROJECT&metricKeys=$METRICS" | jq -r '.component.measures[] | "\(.metric): \(.value)"'

5.1
curl -s -u "$SONAR_TOKEN:" "$SONAR_URL/api/issues/search?componentKeys=$PROJECT" | jq '.issues[] | {severity, type, message}'

5.2
curl -s -u "$SONAR_TOKEN:" "$SONAR_URL/api/issues/search?componentKeys=$PROJECT&types=VULNERABILITY" | jq '.issues[] | {severity, message, line}'

5.3
curl -s -u "$SONAR_TOKEN:" "$SONAR_URL/api/issues/search?componentKeys=$PROJECT&severities=CRITICAL,BLOCKER" | jq '.total'


6.1
curl -s -u "$SONAR_TOKEN:" "$SONAR_URL/api/qualitygates/project_status?projectKey=$PROJECT" | jq -r '.projectStatus.status'

6.2
curl -s -u "$SONAR_TOKEN:" "$SONAR_URL/api/qualitygates/project_status?projectKey=$PROJECT" | jq '.projectStatus.conditions[] | select(.status == "ERROR") | {metric: .metricKey, actual: .actualValue, threshold: .errorThreshold}'

7.
Création fichier sonar-report.sh
chmod -x sonar-report.sh
./sonar-report.sh

nombre de test :
curl -s -u "$SONAR_TOKEN:" "$SONAR_URL/api/issues/search?componentKeys=$PROJECT" | jq '.paging.total'