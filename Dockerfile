FROM bitnami/keycloak:15.0.2-debian-10-r86 as keycloak
COPY ./themes/qualifio /opt/bitnami/keycloak/themes/qualifio
COPY ./themes/engage /opt/bitnami/keycloak/themes/engage
