FROM cidasdpdasartip.cr.usgs.gov:8447/aqcu/aqcu-base:latest

ENV repo_name=mlr-maven-centralized
ENV artifact_id=mlrLegacy
ENV artifact_version=0.16.0-SNAPSHOT
RUN ./pull-from-artifactory.sh ${repo_name} gov.usgs.wma ${artifact_id} ${artifact_version} app.jar

ADD launch-app.sh launch-app.sh
RUN ["chmod", "+x", "launch-app.sh"]

#Default ENV Values
ENV serverPort=443
ENV oauthResourceTokenKeyUri=https://example.gov/oauth/token_key
ENV oauthResourceId=resource-id

ENV mlrLegacyDbHost=localhost
ENV mlrLegacyDbPort=5435
ENV mlrLegacyDataUsername=mlr_legacy_data
ENV mlrLegacyDataPassword=br549
ENV mlrLegacyServicePassword=br549

ENV OAUTH_CLIENT_SECRET_PATH=/oauthClientSecret.txt

ENV HEALTHY_RESPONSE_CONTAINS='{"status":"UP"}'
