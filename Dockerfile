ARG TEMPORAL_VERSION=latest
FROM temporalio/admin-tools:${TEMPORAL_VERSION} as temporal-admin-tools

FROM alpine:3.18
EXPOSE 7233 8233
COPY --from=temporal-admin-tools /usr/local/bin/temporal /usr/local/bin/temporal
ENTRYPOINT [ "/usr/local/bin/temporal", "server", "start-dev", "--ip=0.0.0.0" ]
