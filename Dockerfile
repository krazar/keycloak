FROM docker.io/bitnami/keycloak:15.1.1-debian-10-r13 as keycloak
COPY ./themes/qualifio /opt/bitnami/keycloak/themes/qualifio
COPY ./themes/engage /opt/bitnami/keycloak/themes/engage
COPY ./themes/loyalty_back /opt/bitnami/keycloak/themes/loyalty_back
COPY ./themes/loyalty_front /opt/bitnami/keycloak/themes/loyalty_front
COPY ./themes/loyalty_front_with_form /opt/bitnami/keycloak/themes/loyalty_front_with_form
