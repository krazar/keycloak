FROM bitnami/keycloak:12.0.4-debian-10-r32 as keycloak
COPY ./themes/qualifio /opt/bitnami/keycloak/themes/qualifio
