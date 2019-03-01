FROM usgswma/wma-spring-boot-base:8-jre-slim

ENV repo_name=mlr-maven-centralized
ENV artifact_id=mlrLegacy
ENV artifact_version=0.17.1
ENV requireSsl=true
ENV serverPort=8444
ENV serverContextPath=/
ENV oauthResourceTokenKeyUri=https://example.gov/oauth/token_key
ENV oauthResourceId=resource-id
ENV mlrLegacyDbHost=localhost
ENV mlrLegacyDbPort=5435
ENV mlrLegacyDataUsername=mlr_legacy_data
ENV mlrLegacyDataPassword=changeMe
ENV mlrLegacyServicePassword=changeMe
ENV maintenanceRoles=default-role
ENV HEALTHY_RESPONSE_CONTAINS='{"status":"UP"}'

RUN ./pull-from-artifactory.sh ${repo_name} gov.usgs.wma ${artifact_id} ${artifact_version} app.jar jar

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -k "https://127.0.0.1:${serverPort}${serverContextPath}${HEALTH_CHECK_ENDPOINT}" | grep -q ${HEALTHY_RESPONSE_CONTAINS} || exit 1