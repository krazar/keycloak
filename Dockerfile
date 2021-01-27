FROM bitnami/keycloak:11.0.3-debian-10-r75 as keycloak
COPY ./themes/qualifio /opt/bitnami/keycloak/themes/qualifio
