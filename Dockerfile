FROM bitnami/keycloak:15.1.1-debian-10-r13 as keycloak
COPY ./themes/qualifio /opt/bitnami/keycloak/themes/qualifio
COPY ./themes/engage /opt/bitnami/keycloak/themes/engage
COPY ./themes/engage /opt/bitnami/keycloak/themes/loyalty_back
COPY ./themes/engage /opt/bitnami/keycloak/themes/loyalty_front
