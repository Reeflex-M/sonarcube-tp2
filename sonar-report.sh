#!/bin/bash
# sonar-report.sh

# Chargement automatique des variables depuis le fichier .env s'il existe
if [ -f .env ]; then
    export $(xargs < .env)
fi

# On s'assure que PROJECT est bien défini (soit ici, soit par le .env)
PROJECT="test-vuln-app" 

echo "================================"
echo "RAPPORT DE SECURITE - $PROJECT"
echo "Date: $(date)"
echo "================================"

# Quality Gate
echo "## Quality Gate"
STATUS=$(curl -s -u "$SONAR_TOKEN:" "$SONAR_URL/api/qualitygates/project_status?projectKey=$PROJECT" | jq -r '.projectStatus.status')
echo "Statut : $STATUS"

echo ""

# Metriques
echo "## Metriques"
curl -s -u "$SONAR_TOKEN:" "$SONAR_URL/api/measures/component?component=$PROJECT&metricKeys=vulnerabilities,security_rating" \
| jq -r '.component.measures[] | "- \(.metric): \(.value)"'