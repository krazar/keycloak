FROM bitnami/keycloak:12.0.4-debian-10-r59 as keycloak
COPY ./themes/qualifio /opt/bitnami/keycloak/themes/qualifio
