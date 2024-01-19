FROM docker.io/bitnami/keycloak:23.0.4-debian-11-r0 as keycloak
COPY ./themes/qualifio /opt/bitnami/keycloak/themes/qualifio
COPY ./themes/engage /opt/bitnami/keycloak/themes/engage
COPY ./themes/loyalty_back /opt/bitnami/keycloak/themes/loyalty_back
COPY ./themes/loyalty_front /opt/bitnami/keycloak/themes/loyalty_front
COPY ./themes/loyalty_front_with_form /opt/bitnami/keycloak/themes/loyalty_front_with_form
COPY ./themes/loyalty_christmas_2022 /opt/bitnami/keycloak/themes/loyalty_christmas_2022
COPY ./themes/loyalty_brusseleers /opt/bitnami/keycloak/themes/loyalty_brusseleers
COPY ./themes/generic-theme /opt/bitnami/keycloak/themes/generic-theme
